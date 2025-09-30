import 'package:flutter/material.dart';
import 'package:myapp/controllers/reckoning_controller.dart';
import 'package:myapp/models/requests/pay_debt_between_two_users_request.dart';
import 'package:myapp/models/responses/user_balance_response.dart';
import 'package:myapp/repositories/reckoning_repository.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
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

    groupedByCurrency.clear();

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
                              ...entry.value.map((b) => _buildBalanceCard(b, isDebts)),
                            ],
                          ),
                        )
                        .toList(),
                    ),
            ),
    );
  }

  Widget _buildBalanceCard(UserBalanceResp b, bool isDebts) {
    return GestureDetector(
      onTap: () {
          showRegulateDebtDialog(b);
      },
      child: Card(
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
      ),
    );
  }

  void showRegulateDebtDialog(UserBalanceResp userBalance) {
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
          content: Text(
            "Czy chcesz uregulować dług w ${userBalance.currencyCode} między tobą (${userBalance.user1.username}) i użytkownikiem ${userBalance.user2.username}?\n\n"
            "Oznacza to że wszystkie rozliczenia, które zostały między wami utworzone, zostaną spłacone."
          , style: TextStyle(color: Colors.white),),
          actions: [
            TextButton.icon(
              onPressed: () => RouteHelper.getBack(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: const Text('Cofnij', style: TextStyle(color: Colors.white)),
            ),
            TextButton.icon(
              onPressed: () async {
                await regulateBalances(userBalance);
              },
              icon: const Icon(Icons.payment, color: Colors.white),
              label: const Text('Ureguluj', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Future<void> regulateBalances(UserBalanceResp userBalance) async {
    await regulateDebtBetweenTwoUsers(userBalance);

    if (!mounted) return;

    RouteHelper.getBack(context);
    loadBalances();
  }

  Future<bool> regulateDebtBetweenTwoUsers(UserBalanceResp userBalance) async{
    bool success = await reckoningController.payDebtBetweenTwoUsers(
      PayDebtBetweenTwoUsersReq(
        user1Id: userBalance.user1.userId, 
        user2Id: userBalance.user2.userId, 
        currencyCode: userBalance.currencyCode)
    );

    if(success){
      showToast("Dług uregulowano pomyślnie");
    }
    else{
      showToast("Wystapił błąd podczas regulowania długu.");
    }

    return success;
  }
}

