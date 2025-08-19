import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message){  
  Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

