import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:budget_planner/screens/add_bank.dart';
import 'package:budget_planner/screens/add_bank_success.dart';
import 'package:budget_planner/screens/login.dart';
import 'package:budget_planner/screens/main.dart';
import 'package:budget_planner/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => LoginScreen(), settings: settings);
          case '/register':
            return CupertinoPageRoute(
                builder: (_) => RegisterScreen(), settings: settings);
          case '/add-bank':
            return CupertinoPageRoute(
                builder: (_) => AddBankScreen(), settings: settings);
          case '/add-bank-success':
            return CupertinoPageRoute(
              builder: (_) => AddBankSuccessScreen(),
              settings: settings,
              fullscreenDialog: true,
            );
          case '/main-screen':
            return CupertinoPageRoute(
              builder: (_) => MainScreen(),
              settings: settings,
            );
        }
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 51, 120, 1),
        fontFamily: 'GT-Walshiem-Pro',
        textTheme: TextTheme(
          subtitle: TextStyle(
            fontSize: 12,
          ),
          title: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
