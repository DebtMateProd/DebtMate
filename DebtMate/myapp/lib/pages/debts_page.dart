import 'package:flutter/material.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/responses/user_balance_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';

class BalancePage extends StatefulWidget {
  final bool showDebts; // true: you owe, false: others owe you

  const BalancePage({super.key, required this.showDebts});

  @override
  State<BalancePage> createState() => _BalancePageState();
}


class _BalancePageState extends State<BalancePage> {
  final ReckoningController reckoningController = ReckoningController(ReckoningRepository());
  List<UserBalanceResp> balances = [];
  bool _loading = true;

  final Map<String, List<UserBalanceResp>> groupedByCurrency = {};

  @override
  void initState() {
    super.initState();
    loadBalances();
  }

  Future<void> loadBalances() async {
    final userId = ApiService.instance.userId;
    if (userId == null) {
      showToast('Nie udało się pobrać ID użytkownika.');
      return;
    }

    final result = await reckoningController.getUserBalance(userId);

    if (result.isEmpty) {
      showToast('Nie udało się pobrać sald.');
    }

    for (var b in result) {
      if ((widget.showDebts && b.balance < 0) || (!widget.showDebts && b.balance > 0)) {
        groupedByCurrency.putIfAbsent(b.currencyCode, () => []).add(b);
      }
    }

    setState(() {
      balances = groupedByCurrency.entries
          .expand((entry) => entry.value)
          .toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDebts = widget.showDebts;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isDebts ? 'Twoje długi' : 'Kto jest ci winien',
          style: const TextStyle(color: Colors.white),
        ),
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
              child: balances.isEmpty
                  ? Center(
                      child: Text(
                        isDebts
                            ? 'Nie masz żadnych długów 🎉'
                            : 'Nikt nie jest ci winien 💸',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView(
                      children: groupedByCurrency.entries
                        .map(
                          (entry) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  entry.key,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              ...entry.value.map((b) => _buildBalanceCard(b, isDebts)).toList(),
                            ],
                          ),
                        )
                        .toList(),
                    ),
            ),
    );
  }

  Widget _buildBalanceCard(UserBalanceResp b, bool isDebts) {
    return Card(
      color: Colors.cyan.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          isDebts ? Icons.money_off : Icons.attach_money,
          color: Colors.white,
        ),
        title: Text(
          b.user2.username,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          isDebts
              ? 'Jesteś mu winien: ${b.balance.abs().toStringAsFixed(2)} ${b.currencyCode}'
              : 'Jest ci winien: ${b.balance.toStringAsFixed(2)} ${b.currencyCode}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

