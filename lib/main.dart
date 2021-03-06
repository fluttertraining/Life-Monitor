import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:budget_planner/screens/add_bank.dart';
import 'package:budget_planner/screens/add_bank_success.dart';
import 'package:budget_planner/screens/budget.dart';
import 'package:budget_planner/screens/login.dart';
import 'package:budget_planner/screens/register.dart';

import 'package:budget_planner/screens/budget/add_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onUnknownRoute: (any) {
        print('in the inital [onUnknowRoute]');
      },
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
          case '/budget-screen':
            return CupertinoPageRoute(
              builder: (_) => BudgetScreen(),
              settings: settings,
            );

          case '/add-transaction':
            return CupertinoPageRoute(
              builder: (_) => AddTransactionScreen(),
              settings: settings,
              fullscreenDialog: true,
            );
        }
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 51, 120, 1),
        fontFamily: 'GT-Walshiem-Pro',
        scaffoldBackgroundColor: Color.fromRGBO(242, 242, 242, 1),
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
