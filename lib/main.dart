import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:budget_planner/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => MyHomePage(),
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
    );
  }
}
