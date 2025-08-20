import 'package:flutter/material.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/requests/pay_user_debt_request.dart';
import 'package:myapp/models/responses/user_debt_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';

class ReckoningsPage extends StatefulWidget {
  const ReckoningsPage({super.key});

  @override
  State<ReckoningsPage> createState() => ReckoningsPageState();
}

class ReckoningsPageState extends State<ReckoningsPage> {
  final ReckoningController reckoningController = ReckoningController(ReckoningRepository());
  List<UserDebtResp> userDebts = [];
  List<UserDebtResp> unpaidDebts = [];
  List<UserDebtResp> paidDebts = [];
  bool _loading = true;
  bool _loadingPaidDebts = false;
  bool _showPaid = false;

  @override
  void initState() {
    super.initState();
    getUserDebts();
  }

  Future<void> getUserDebts() async {
    final userId = ApiService.instance.userId;

    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    unpaidDebts = await reckoningController.getUserDebts(userId, false);

    setState(() => _loading = false);
  }

  Future<void> loadPaidDebts() async {
    final userId = ApiService.instance.userId;

    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    setState(() {
      _loadingPaidDebts = true;
    });

    paidDebts = await reckoningController.getUserDebts(userId, true);

    setState(() {
      _loadingPaidDebts = false;
      _showPaid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje rozliczenia', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView(
                children: [
                  if (unpaidDebts.isEmpty)
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Brak nieopłaconych rozliczeń',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  else
                    ...unpaidDebts.map((debt) => _buildDebtCard(debt)),
                  ExpansionTile(
                    shape: Border(),
                    title: Text(
                      'Rozliczenia opłacone',
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(_showPaid ? Icons.expand_less : Icons.expand_more, color: Colors.cyan, size: 28),
                    onExpansionChanged: (expanded) {
                      if (expanded && paidDebts.isEmpty && !_loadingPaidDebts) {
                        loadPaidDebts();
                      } else {
                        setState(() {
                          _showPaid = expanded;
                        });
                      }
                    },
                    children: <Widget>[
                      if (_loadingPaidDebts)
                        const Center(child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(color: Colors.white),
                        ))
                      else
                        ...paidDebts.map((debt) => _buildDebtCard(debt)),
                    ],
                  ),
                  
                ],
              ),
            ),
    );
  }

  Widget _buildDebtCard(UserDebtResp debt) {
    return Card(
      color: Colors.cyan.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          debt.isPaid ? Icons.check_circle : Icons.pending_actions,
          color: debt.isPaid ? Colors.greenAccent : Colors.redAccent,
        ),
        title: Text(
          debt.reckoningName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [   
            Text('Do zapłaty: ${debt.owedAmount.toStringAsFixed(2)} ${debt.currencyCode}', style: TextStyle(color: Colors.white)),
            Text('Płatnik: ${debt.payerName}', style: TextStyle(color: Colors.white)),
          ],
        ),
        onTap: () => showDebtDetails(debt),
      ),
    );
  }

  void showDebtDetails(UserDebtResp debt) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.info, color: Colors.white),
            const Text(
              'Szczegóły',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            _detailRow(Icons.receipt, 'Nazwa', debt.reckoningName),
            _detailRow(Icons.description, 'Opis', debt.description ?? '-'),
            _detailRow(Icons.person, 'Płatnik', debt.payerName),
            _detailRow(Icons.attach_money, 'Dług', '${debt.owedAmount.toStringAsFixed(2)} ${debt.currencyCode}'),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () => RouteHelper.getBack(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            label: const Text('Cofnij', style: TextStyle(color: Colors.white)),
          ),
          debt.isPaid ? SizedBox() : TextButton.icon(
            onPressed: () => payUserDebt(debt),
            icon: const Icon(Icons.payment, color: Colors.white),
            label: const Text('Spłać', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 14),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> payUserDebt(UserDebtResp debt) async {
    bool success = await reckoningController.payUserDebt(PayUserDebtReq(userId: ApiService.instance.userId!, reckoningId: debt.reckoningId));

    if (success) {
      showToast('Dług został spłacony.');
      await getUserDebts();
    } else {
      showToast('Nie udało się spłacić długu.');
    }

    RouteHelper.getBack();
  }
}