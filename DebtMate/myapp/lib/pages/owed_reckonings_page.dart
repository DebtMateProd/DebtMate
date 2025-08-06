import 'package:flutter/material.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/responses/reckoning_debtors_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';

class ReckoningsOwedPage extends StatefulWidget {
  const ReckoningsOwedPage({super.key});

  @override
  State<ReckoningsOwedPage> createState() => _ReckoningsOwedPageState();
}

class _ReckoningsOwedPageState extends State<ReckoningsOwedPage> {
  final ReckoningController reckoningController = ReckoningController(ReckoningRepository());
  List<ReckoningDebtorsResp> unpaidDebts = [];
  List<ReckoningDebtorsResp> paidDebts = [];
  bool _loading = true;
  bool _paidDebtsLoading = false;
  bool _paidDebtsLoaded = false;


  @override
  void initState() {
    super.initState();
    getUnpaidDebts();
  }

  Future<void> getUnpaidDebts() async {
    final userId = ApiService.instance.userId;

    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    unpaidDebts = await reckoningController.getDebtsOwedToUser(userId, false);
    setState(() {
      _loading = false;
    });
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
    return Card(
      color: Colors.cyan,
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
                        '${debtor.owedAmount.toStringAsFixed(2)} zł',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
