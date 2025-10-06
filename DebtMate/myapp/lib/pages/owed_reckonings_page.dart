import 'package:flutter/material.dart';
import 'package:myapp/controllers/currency_controller.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/requests/add_new_reckoning_request.dart';
import 'package:myapp/models/requests/update_reckoning_request.dart';
import 'package:myapp/models/responses/currency_response.dart';
import 'package:myapp/models/responses/reckoning_debtors_response.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/currency_repository.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/text_field.dart';

class ReckoningsOwedPage extends StatefulWidget {
  const ReckoningsOwedPage({super.key});

  @override
  State<ReckoningsOwedPage> createState() => _ReckoningsOwedPageState();
}

class _ReckoningsOwedPageState extends State<ReckoningsOwedPage> {
  final ReckoningController reckoningController = ReckoningController(ReckoningRepository());
  final FriendController _friendController = FriendController(FriendRepository());
  final CurrencyController _currencyController = CurrencyController(CurrencyRepository());
  
  CurrencyResp? _selectedCurrency;
  List<CurrencyResp> _currencies = [];
  List<ReckoningDebtorsResp> unpaidDebts = [];
  List<ReckoningDebtorsResp> paidDebts = [];
  List<UserResp> _users = [];
  bool _loading = true;
  bool _paidDebtsLoading = false;
  bool _paidDebtsLoaded = false;


  @override
  void initState() {
    super.initState();
    getUnpaidDebts();
  }

  Future<void> _fetchData() async {
    await _fetchFriends();
    await _fetchCurrencies();

    setState(() {
      _loading = false;
    });

  }


  Future<void> _fetchFriends() async {
    final userId = ApiService.instance.userId ?? '';
    final friends = await _friendController.getUserFriends(userId);
    final currentUser = UserResp(userId: userId, username: "Ja"); // or fetch real username
    setState(() {
      _users = [currentUser, ...friends];
    });
  }

  Future<void> _fetchCurrencies() async {
    final currencies = await _currencyController.getAllCurrencies();
    setState(() {
      _currencies = currencies;
      if (_currencies.isNotEmpty) {
        _selectedCurrency = _currencies.first;
      }
    });
  }

  Future<void> getUnpaidDebts() async {
    final userId = ApiService.instance.userId;

    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    unpaidDebts = await reckoningController.getDebtsOwedToUser(userId, false);

    setState(() => _loading = false);
  }

  Future<void> getPaidDebts() async {
    if (_paidDebtsLoaded || _paidDebtsLoading) return;

    setState(() {
      _paidDebtsLoading = true;
    });

    final userId = ApiService.instance.userId;
    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    paidDebts = await reckoningController.getDebtsOwedToUser(userId, true);

    setState(() {
      _paidDebtsLoaded = true;
      _paidDebtsLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Należności od innych', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: unpaidDebts.isEmpty && !_paidDebtsLoaded
                  ? const Center(
                      child: Text('Nikt Ci nic nie zalega 😄',
                          style: TextStyle(color: Colors.white, fontSize: 16)))
                  : ListView(
                      children: [
                        ...unpaidDebts.map(_buildOwedCard),
                        ExpansionTile(
                          shape: const Border(),
                          title: const Text(
                            'Rozliczenia całkowicie spłacone',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          onExpansionChanged: (expanded) {
                            if (expanded) {
                              getPaidDebts();
                            }
                          },
                          children: _paidDebtsLoading
                              ? [const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(child: CircularProgressIndicator()),
                                )]
                              : paidDebts.map(_buildOwedCard).toList(),
                        ),
                      ],
                    ),
            ),
    );
  }


    Widget _buildOwedCard(ReckoningDebtorsResp debt) {
    return GestureDetector(
      onTap: () => showReckoningDetailsDialog(context, debt),
      child: Card(
        color: Colors.cyan.shade400,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rozliczenie: "${debt.reckoningName}"',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Opis: ${debt.description != "" ? debt.description : '-'}',
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                'Dłużnicy:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ...debt.debtors.map((debtor) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            debtor.debtorName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          debtor.isPaid ? '✔' : '✘',
                          style: TextStyle(
                            color: debtor.isPaid ? Colors.greenAccent : Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${debtor.owedAmount.toStringAsFixed(2)} ${debt.currencyCode}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void showReckoningDetailsDialog(BuildContext context, ReckoningDebtorsResp reckoning) {
    bool isEditing = false;

    final TextEditingController nameController = TextEditingController(text: reckoning.reckoningName);
    final TextEditingController descriptionController = TextEditingController(text: reckoning.description);
    final List<TextEditingController> debtorControllers = reckoning.debtors.map((debtor) {
      return TextEditingController(text: debtor.owedAmount.toStringAsFixed(2));
    }).toList();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.cyan.shade400,
              title: Text(
                isEditing ? 'Edytuj rozliczenie' : 'Szczegóły rozliczenia',
                style: const TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextField(
                      controller: nameController,
                      readOnly: !isEditing,
                      labelText: 'Nazwa rozliczenia',
                    ),
                    InputTextField(
                      controller: descriptionController,
                      readOnly: !isEditing,
                      labelText: 'Opis',
                    ),
                    const Text(
                      'Dłużnicy:',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      spacing: 10,
                      children:[
                        ...reckoning.debtors.asMap().entries.map((entry) {
                        final index = entry.key;
                        final debtor = entry.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                debtor.debtorName,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                debtor.isPaid ? '✔' : '✘',
                                style: TextStyle(
                                  color: debtor.isPaid ? Colors.greenAccent : Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: 
                              InputTextField(
                                controller: debtorControllers[index],
                                readOnly: !isEditing,
                                labelText: 'Kwota długu',
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        );
                      }),
                    ]
                  ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Zamknij', style: TextStyle(color: Colors.white)),
                ),
                if (isEditing)
                  TextButton(
                    onPressed: () async {
                      // Prepare updated reckoning data
                      final updatedDebtors = reckoning.debtors.asMap().entries.map((entry) {
                        final index = entry.key;
                        final debtor = entry.value;
                        return DebtorInfoResp(
                          debtorId: debtor.debtorId,
                          debtorName: debtor.debtorName,
                          owedAmount: double.tryParse(debtorControllers[index].text) ?? debtor.owedAmount,
                          isPaid: debtor.isPaid,
                        );
                      }).toList();

                      final updatedReckoning = UpdateReckoningReq(
                        id: reckoning.reckoningId,
                        name: nameController.text,
                        description: descriptionController.text,
                        totalCost: updatedDebtors.fold(0.0, (sum, debtor) => sum + debtor.owedAmount),
                        payerId: ApiService.instance.userId ?? '',
                        currencyCode: reckoning.currencyCode,
                        debts: updatedDebtors.map((debtor) => UserDebtReq(
                          userId: debtor.debtorId,
                          amount: debtor.owedAmount,
                          isPaid: debtor.isPaid,
                        )).toList(),
                      );

                      // Call updateReckoning function
                      final success = await reckoningController.updateReckoning(updatedReckoning);

                      if (success) {
                        showToast('Rozliczenie zaktualizowane!');
                        Navigator.of(context).pop();
                      } else {
                        showToast('Nie udało się zaktualizować rozliczenia.');
                      }
                    },
                    child: const Text('Zapisz', style: TextStyle(color: Colors.white)),
                  ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(
                    isEditing ? 'Anuluj edycję' : 'Edytuj',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
