import 'package:finapp/bankloan.dart';
//import 'package:finapp/duebill.dart';
//import 'package:finapp/paidbill.dart';
import 'package:finapp/dashboard.dart';
import 'package:finapp/overview.dart';
import 'package:finapp/savings.dart';
import 'package:finapp/signup.dart';
//import 'package:finapp/signup.dart';
//import 'package:finapp/overview.dart';
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
      home: OverviewPage() 
      );
  }
}
