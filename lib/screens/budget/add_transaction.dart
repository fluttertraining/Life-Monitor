import 'package:flutter/material.dart';

import 'package:budget_planner/config/enums.dart';
import 'package:budget_planner/screens/add_transaction/details.dart';
import 'package:budget_planner/screens/add_transaction/type.dart';
import 'package:budget_planner/widgets/rounded_appbar.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TransactionTypes transactionType;

  void _onTransactionTypePressed(TransactionTypes selectedType) {
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    setState(() {
      transactionType = selectedType;
      print('Updated transactionType to $transactionType');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 0),
        child: Container(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new _AppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PageView(
                  physics: transactionType == null
                      ? NeverScrollableScrollPhysics()
                      : null,
                  controller: _pageController,
                  children: <Widget>[
                    new TransactionType(
                      onTransactionTypePressed: this._onTransactionTypePressed,
                    ),
                    new TransactionDetails(
                      transactionType: this.transactionType,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedAppBar(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text(
            'Add Transaction',
            style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 20,
                ),
          ),
        ],
      ),
    );
  }
}
