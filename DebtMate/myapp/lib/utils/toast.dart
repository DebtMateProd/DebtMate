import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(String message){
  Toast.show(message,
        duration: 1,
        gravity: Toast.bottom,
        textStyle: TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.black,
    );
}

