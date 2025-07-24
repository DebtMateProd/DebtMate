import 'package:flutter/material.dart';
import 'package:myapp/utils/route_helper.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  labelText: 'Dodaj rozliczenie',
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
