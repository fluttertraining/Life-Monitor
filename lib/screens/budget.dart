import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:budget_planner/screens/budget/daily_transactions.dart';
import 'package:budget_planner/screens/budget/transaction_summary.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectedIndex = 0;

  final dailyTransactionsPage = Navigator(
    initialRoute: '/',
    onUnknownRoute: (any) {
      print('unknown route');
    },
    onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return CupertinoPageRoute(
            builder: (_) => DailyTransactionsScreen(),
            settings: settings,
          );

        case '/transaction-summary':
          return CupertinoPageRoute(
            builder: (_) => TransactionSummary(),
            settings: settings,
          );
      }
    },
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // controller.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _selectedIndex != 0,
            child: dailyTransactionsPage,
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Text('Page'),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Text('Page'),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Text('Page'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/add-transaction');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Daily'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Budget'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
