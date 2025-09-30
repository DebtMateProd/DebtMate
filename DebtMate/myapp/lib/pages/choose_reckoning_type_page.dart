import 'package:flutter/material.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/widgets/button.dart';

class ReckoningTypePage extends StatefulWidget {
  const ReckoningTypePage({super.key});

  @override
  State<ReckoningTypePage> createState() => _ReckoningTypePageState();
}

class _ReckoningTypePageState extends State<ReckoningTypePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wybierz rodzaj rozliczenia", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        centerTitle: true,
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
                  labelText: '➕ Dodaj pojedyncze rozliczenie',
                  onPressed: () {
                     RouteHelper.getTo(context, '/addreckoning');
                  },
                ),
                CustomButton(
                  labelText: '➕ Dodaj rozliczenie paragonu',
                  onPressed: () {
                     RouteHelper.getTo(context, '/addReceipt');
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
