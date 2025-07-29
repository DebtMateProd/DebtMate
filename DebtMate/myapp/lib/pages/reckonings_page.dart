import 'package:flutter/material.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/responses/user_debt_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
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
  bool _showPaid = false;

  @override
  void initState() {
    super.initState();
    getUserDebts();
  }

  Future<void> getUserDebts() async {
    final userId = ApiService.instance.userId;
    
    if (userId != null) {
      userDebts = await reckoningController.getUserDebts(userId);
      setState(() {
        unpaidDebts = userDebts.where((debt) => !debt.isPaid).toList();
        paidDebts = userDebts.where((debt) => debt.isPaid).toList();
        _loading = false;
      });
    } else {
      showToast('Nie udało się pobrać ID użytkownika.');
    }
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
                  ...unpaidDebts.map((debt) => _buildDebtCard(debt)),
                  ExpansionTile(
                    title: Text('Rozliczenia opłacone (${paidDebts.length})', style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.expand_more,
                      color: Colors.cyan,
                      size: 28,
                    ),
                    children: <Widget>[
                      if (_showPaid)
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
      color: Colors.cyan,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          debt.isPaid ? Icons.check_circle : Icons.pending_actions,
          color: debt.isPaid ? Colors.cyan : Colors.redAccent,
        ),
        title: Text(
          debt.reckoningName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (debt.description != null && debt.description!.isNotEmpty)
              Text(debt.description!, style: TextStyle(color: Colors.white),),
            Text('Do zapłaty: ${debt.owedAmount.toStringAsFixed(2)} zł', style: TextStyle(color: Colors.white)),
            Text('Płatnik: ${debt.payerName}', style: TextStyle(color: Colors.white)),
          ],
        ),
        onTap: () {
        },
      ),
    );
  }
}