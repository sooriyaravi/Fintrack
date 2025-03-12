
import 'package:finapp/chat.dart';
import 'package:finapp/emireduction.dart';
import 'package:finapp/loanlist.dart';
import 'package:finapp/loanterm.dart';
import 'package:finapp/login.dart';
import 'package:finapp/negotiation.dart';
import 'package:finapp/profile.dart';
import 'package:finapp/savings.dart';
import 'package:finapp/signup.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Signup(),
      );
  }
}
