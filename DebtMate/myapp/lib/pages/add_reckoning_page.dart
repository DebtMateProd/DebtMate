import 'package:flutter/material.dart';
import 'package:myapp/controllers/currency_controller.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/requests/add_new_reckoning_request.dart';
import 'package:myapp/models/requests/update_reckoning_request.dart';
import 'package:myapp/models/responses/currency_response.dart';
import 'package:myapp/models/responses/reckoning_debtors_response.dart';
import 'package:myapp/repositories/currency_repository.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/drop_down.dart';
import 'package:myapp/widgets/text_field.dart';

class AddEditReckoningPage extends StatefulWidget {
  
  final ReckoningDebtorsResp? reckoningToEdit;

  const AddEditReckoningPage({super.key, this.reckoningToEdit});

  @override
  State<AddEditReckoningPage> createState() => _AddEditReckoningPageState();
}

class _AddEditReckoningPageState extends State<AddEditReckoningPage> {
  final FriendController _friendController = FriendController(FriendRepository());
  final ReckoningController _reckoningController = ReckoningController(ReckoningRepository());
  final CurrencyController _currencyController = CurrencyController(CurrencyRepository());

  List<UserResp> _users = [];
  List<CurrencyResp> _currencies = [];
  CurrencyResp? _selectedCurrency;
  UserResp? _payer;
  double? _totalCost;
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final Map<UserResp, double> _debts = {};
  final Map<UserResp, bool> _debtsStatus = {};
  final Set<String> _selectedDebtors = {};
  final Map<UserResp, TextEditingController> _debtControllers = {};

  bool _loading = true;
  bool get _isEditing => widget.reckoningToEdit != null;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchFriends();
    await _fetchCurrencies();

    if (_isEditing) {
      _fillFormWithData();
    }

    setState(() {
      _loading = false;
    });

  }

  void _fillFormWithData() {
    final data = widget.reckoningToEdit!;

    _nameController.text = data.reckoningName;
    _descriptionController.text = data.description ?? '';
    
    _totalCost = data.totalCost; 
    _costController.text = _totalCost?.toStringAsFixed(2) ?? "0.00";

    _selectedCurrency = _currencies.firstWhere((c) => c.code == data.currencyCode);
    

    final currentUserId = ApiService.instance.userId;
    if (currentUserId != null) {
        _payer = _users.firstWhere((u) => u.userId == currentUserId);
    }

    double sumOfDebtors = 0.0;

    for (var debtorInfo in data.debtors) {
      try {
        final user = _users.firstWhere((u) => u.userId == debtorInfo.debtorId);

        _selectedDebtors.add(user.userId);
        _debts[user] = debtorInfo.owedAmount;
        _debtsStatus[user] = debtorInfo.isPaid;
        _debtControllers[user] = TextEditingController(text: debtorInfo.owedAmount.toStringAsFixed(2));

        sumOfDebtors += debtorInfo.owedAmount;
      } catch (e) {
        print("Nie znaleziono użytkownika o ID: ${debtorInfo.debtorId}");
      }
    }

    if (_totalCost != null && (_totalCost! - sumOfDebtors) > 0.01) {
      double myShare = _totalCost! - sumOfDebtors;

      if (currentUserId != null) {
        final me = _users.firstWhere((u) => u.userId == currentUserId);

        if (!_selectedDebtors.contains(me.userId)) {
          _selectedDebtors.add(me.userId);
          _debts[me] = myShare;
          _debtsStatus[me] = true; 
          _debtControllers[me] = TextEditingController(text: myShare.toStringAsFixed(2));
        }
      }
    }
  }

  Future<void> _fetchFriends() async {
    final userId = ApiService.instance.userId ?? '';
    final friends = await _friendController.getUserFriends(userId);
    final currentUser = UserResp(userId: userId, username: "Ja");
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

  @override
  void dispose() {
    _costController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    for (var controller in _debtControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  void _submitReckoning() {

    if (!checkIfAllFormFieldsFilled()) return;

    final debtsList = _debts.entries.map((entry) => UserDebtReq(
      userId: entry.key.userId,
      amount: entry.value,
      isPaid: _debtsStatus[entry.key] ?? false,
    )).toList();

    // ZMIANA: Rozwidlenie logiki na ADD i UPDATE
    if (_isEditing) {
      _handleUpdate(debtsList);
    } else {
      _handleAdd(debtsList);
    }
  }

  void _handleAdd(List<UserDebtReq> debtsList) {
    final request = AddNewReckoningReq(
      name: _nameController.text,
      description: _descriptionController.text,
      totalCost: _totalCost ?? 0.0,
      payerId: _payer?.userId ?? '',
      debts: debtsList,
      currencyCode: _selectedCurrency?.code ?? '',
    );

    _reckoningController.addNewReckoning(request).then((success) {
      if (success) {
        showToast('Rozliczenie dodane poprawnie!');
        
        if (!mounted) return;
        RouteHelper.getBack(context);
      } else {
        showToast('Nie udało się dodać rozliczenia. Sprawdź dane i spróbuj ponownie.');
      }
    });
  }

  void _handleUpdate(List<UserDebtReq> debtsList) {
    final id = widget.reckoningToEdit!.reckoningId;

    final request = UpdateReckoningReq(
      id: id,
      name: _nameController.text,
      description: _descriptionController.text,
      totalCost: _totalCost ?? 0.0,
      payerId: _payer?.userId ?? '',
      debts: debtsList,
      currencyCode: _selectedCurrency?.code ?? '',
    );

    _reckoningController.updateReckoning(request).then((success) {
      if (success) {
        showToast('Rozliczenie zaktualizowane!');
        if (!mounted) return;
        Navigator.pop(context, true);
      } else {
        showToast('Nie udało się zaktualizować rozliczenia.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double debtsSum = 0.0;
    for (var debt in _debts.values) {
      debtsSum += debt;
    }

    double left = (_totalCost ?? 0.0) - debtsSum;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edytuj rozliczenie' : 'Dodaj rozliczenie', style: const TextStyle(color: Colors.white)),        
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: InputTextField(
                            controller: _nameController,
                            labelText: 'Nazwa rozliczenia',
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: InputTextField(
                            controller: _descriptionController,
                            labelText: 'Opis (opcjonalne)',
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text('Kto zapłacił?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: CustomDropdown<UserResp>(
                            items: _users,
                            value: _payer,
                            hint: 'Wybierz osobę',
                            onChanged: (value) => setState(() => _payer = value),
                            itemBuilder: (user) => Row(
                              children: [
                                Text(user.username, style: const TextStyle(color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text('Całkowity koszt', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ), 
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: InputTextField(
                            controller: _costController,
                            labelText: 'Podaj kwotę',
                            inputType: TextInputType.number,
                            onChanged: (val) {
                              setState(() {
                                _totalCost = double.tryParse(val);
                              });
                            },
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: CustomDropdown<CurrencyResp>(
                            items: _currencies,
                            value: _selectedCurrency,
                            hint: 'Wybierz walutę',
                            onChanged: (value) => setState(() => _selectedCurrency = value),
                            itemBuilder: (currency) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(currency.code, style: const TextStyle(color: Colors.white, fontSize: 15)),
                                Text(currency.name, style: const TextStyle(color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text('Podziel koszt między osoby', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomButton(
                            labelText: 'Wybierz osoby do podziału', 
                            onPressed: (){
                              addDebtorsToReckoning();
                            }
                          )
                        ),
                        _selectedDebtors.isEmpty ? Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text('Nie wybrano osób do podziału', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ) : SizedBox(),
                        if (_totalCost != null && _totalCost! > 0) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              left == 0
                                ? 'Cała kwota została podzielona.'
                                : left > 0
                                  ? 'Pozostało do podziału: ${left.toStringAsFixed(2)}'
                                  : 'Podzielono za dużo: ${left.abs().toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        ..._selectedDebtors.map((userId) {
                          final friend = _users.firstWhere((f) => f.userId == userId);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(friend.username, style: const TextStyle(color: Colors.white, fontSize: 15)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      _selectedDebtors.remove(userId);
                                      _debts.remove(friend);
                                      _debtsStatus.remove(friend);
                                      _debtControllers[friend]?.dispose();
                                      _debtControllers.remove(friend);
                                    });
                                  },
                                ),
                                if (_isEditing)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Przełączanie statusu true/false
                                        final currentStatus = _debtsStatus[friend] ?? false;
                                        _debtsStatus[friend] = !currentStatus;
                                      });
                                    },
                                    child: Text(
                                      (_debtsStatus[friend] ?? false) ? '✔' : '✘',
                                      style: TextStyle(
                                        // Zielony ptaszek, czerwony iks
                                        color: (_debtsStatus[friend] ?? false) ? Colors.greenAccent : Colors.redAccent,
                                        fontSize: 24, // Trochę większe, żeby łatwo trafić palcem
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InputTextField(
                                    controller: _debtControllers[friend]!,
                                    labelText: 'Kwota osoby',
                                    inputType: TextInputType.number,
                                    onChanged: (val) {
                                      setState(() {
                                        double? amount = double.tryParse(val);
                                        if (amount != null) {
                                          _debts[friend] = amount;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        (_totalCost != null && _totalCost! > 0 && _selectedDebtors.isNotEmpty) ?
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
                              child: CustomButton(
                                labelText: 'Podziel koszt', 
                                onPressed: setTotalCostEquallyBetweenDebtors
                              ),
                            ),
                          ],
                        ) : SizedBox(),
                        CustomButton(
                          labelText: _isEditing ? 'Zapisz zmiany' : 'Dodaj rozliczenie',                          
                          onPressed: _submitReckoning
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void addDebtorsToReckoning(){
    Set<String> tempSelected = Set<String>.from(_selectedDebtors);

    showDialog(
      context: context,
      builder: (context) {
        bool selectAll = tempSelected.length == _users.length;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.cyan,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text("Wybierz osoby", style: TextStyle(color: Colors.white)),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Select all checkbox
                    Text('Wybierz osoby biorące udział w rozliczeniu', style: TextStyle(color: Colors.white)),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Zaznacz wszystkich", style: TextStyle(color: Colors.white)),
                      value: selectAll,
                      onChanged: (checked) {
                        setState(() {
                          selectAll = checked ?? false;
                          if (selectAll) {
                            tempSelected = _users.map((u) => u.userId).toSet();
                          } else {
                            tempSelected.clear();
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.cyan.shade200,
                      side: BorderSide(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    ..._users.map((user) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.username, style: const TextStyle(color: Colors.white)),
                        value: tempSelected.contains(user.userId),
                        onChanged: (checked) {
                          setState(() {
                            if (checked ?? false) {
                              tempSelected.add(user.userId);
                            } else {
                              tempSelected.remove(user.userId);
                            }
                            selectAll = tempSelected.length == _users.length;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.cyan.shade200,
                        side: BorderSide(color: Colors.white),
                      );
                    }),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Anuluj", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    this.setState(() {
                      _selectedDebtors.clear();
                      _debts.clear();

                      for (var user in _users) {
                        if (tempSelected.contains(user.userId)) {
                          _selectedDebtors.add(user.userId);

                          if (!_debts.containsKey(user)) {
                            _debts[user] = 0.0;
                            _debtControllers[user] = TextEditingController(text: '0.0');
                            _debtsStatus[user] = false; 
                          }
                        }
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Potwierdź", style: TextStyle(color: Colors.white)),
                )
              ],
            );
          },
        );
      },
    );
  }

  void setTotalCostEquallyBetweenDebtors(){
    final equalAmount = _totalCost! / _selectedDebtors.length;

    setState(() {
      for (var userId in _selectedDebtors) {
        final friend = _users.firstWhere((f) => f.userId == userId);
        _debts[friend] = double.parse(equalAmount.toStringAsFixed(2));
        _debtControllers[friend]?.text = equalAmount.toStringAsFixed(2);
      }
    });                           
  }

  bool checkIfAllFormFieldsFilled() {
    if (_nameController.text.trim().isEmpty) {
      showToast('Podaj nazwę rozliczenia.');
      return false;
    }

    if (_payer == null) {
      showToast('Wybierz osobę, która zapłaciła.');
      return false;
    }

    if (_totalCost == null || _totalCost! <= 0) {
      showToast('Podaj całkowity koszt.');
      return false;
    }

    if (_selectedDebtors.isEmpty) {
      showToast('Dodaj przynajmniej jedną osobę.');
      return false;
    }

    for (var friend in _debts.keys) {
      final amount = _debts[friend];
      if (amount == null || amount <= 0) {
        showToast('Podaj koszt dla każdej osoby.');
        return false;
      }
    }

    if (_selectedDebtors.length == 1 && _selectedDebtors.contains(_payer!.userId)) {
      showToast('Osoba, która zapłaciła, nie może być jedynym dłużnikiem.');
      return false;
    }

    double debtsSum = 0.0;
    for (var debt in _debts.values) {
      debtsSum += debt;
    }

    if ((debtsSum - (_totalCost ?? 0.0)).abs() > 0.01) {
      showToast('Suma długów nie zgadza się z całkowitym kosztem.');
      return false;
    }

    return true;
  }
}