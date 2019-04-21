import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hands_on_contact_picker/app_theme.dart';
import 'package:hands_on_contact_picker/pages/login_page.dart';

void main() {
  FirebaseAdMob.instance.initialize(
    appId: 'YOUR_ADMOB_APPID'
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: LoginPage(),
    );
  }
}
