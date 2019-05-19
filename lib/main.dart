import 'package:flutter/material.dart';

import 'package:budget_planner/screens/login.dart';
import 'package:budget_planner/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegisterScreen(),
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
