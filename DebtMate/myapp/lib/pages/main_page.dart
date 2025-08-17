import 'package:flutter/material.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/button.dart';
import 'package:toast/toast.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isFriendsExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("DebtMate", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            ExpansionTile(
              shape: Border(),
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Icon(Icons.people, color: Colors.white),
              ),
              title: Text(
                'Znajomi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(
                _isFriendsExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.cyan,
                size: 28,
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isFriendsExpanded = expanded;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          labelText: 'Dodaj znajomego',
                          onPressed: () {
                            RouteHelper.getTo('/addfriend');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          labelText: 'Wyświetl znajomych',
                          onPressed: () {
                            RouteHelper.getTo('/friends');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          labelText: 'Wyświetl zaproszenia',
                          onPressed: () {
                            RouteHelper.getTo('/friendrequests');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Icon(Icons.logout, color: Colors.white),
              ),
              title: Text('Wyloguj', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () {
                ApiService.instance.token = null;
                ApiService.instance.userId = null;

                showToast("Wylogowano pomyślnie");
                RouteHelper.popUntilHome();
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  labelText: '➕ Dodaj nowe rozliczenie',
                  onPressed: () {
                     RouteHelper.getTo('/chooseReckoningType');
                  },
                ),
                Text("Sprawdź rozliczenia, w których", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Column(
                  spacing: 8.0,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            labelText: '💸 Jesteś dłużnikiem',
                            onPressed: () {
                               RouteHelper.getTo('/reckonings');
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            labelText: '🧾 Jesteś płatnikiem',
                            onPressed: () {
                              RouteHelper.getTo('/owedReckonings');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text("Sprawdź bilans wydatków", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Column(
                  spacing: 8.0,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            labelText: '📉 Komu wiszę kasę',
                            onPressed: () {
                               RouteHelper.getToWithArgs('/balance', true);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            labelText: '📈 Kto mi wisi kasę',
                            onPressed: () {
                              RouteHelper.getToWithArgs('/balance', false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
