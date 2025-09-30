import 'package:flutter/material.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/button.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("DebtMate", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      onDrawerChanged: (isOpen) {
        if(!isOpen){
          setState(() {
            _isFriendsExpanded = false;
          });
        }
      },
      drawer: Drawer(
        backgroundColor: Colors.cyan.shade400,
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
                backgroundColor: Colors.white,
                child: Icon(Icons.people, color: Colors.cyan),
              ),
              title: Text(
                'Znajomi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                _isFriendsExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.white,
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
                            RouteHelper.getTo(context, '/addfriend');
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
                            RouteHelper.getTo(context, '/friends');
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
                            RouteHelper.getTo(context, '/friendrequests');
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
                backgroundColor: Colors.white,
                child: Icon(Icons.logout, color: Colors.cyan),
              ),
              title: Text('Wyloguj', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () async {
                await logout();
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
                     RouteHelper.getTo(context, '/chooseReckoningType');
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
                               RouteHelper.getTo(context, '/reckonings');
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
                              RouteHelper.getTo(context, '/owedReckonings');
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
                               RouteHelper.getToWithArgs(context, '/balance', true);
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
                              RouteHelper.getToWithArgs(context, '/balance', false);
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

  Future<void> logout() async{
    await ApiService.instance.clearToken();

    showToast("Wylogowano pomyślnie");

    if (!mounted) return;
    RouteHelper.goToHomeSetRoot(context);
  }
}
