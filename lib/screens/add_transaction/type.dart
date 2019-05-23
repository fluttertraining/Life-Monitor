import 'package:flutter/material.dart';

import 'package:budget_planner/config/enums.dart';

class TransactionType extends StatelessWidget {
  const TransactionType({
    Key key,
    @required this.onTransactionTypePressed,
  }) : super(key: key);

  final Function(TransactionTypes type) onTransactionTypePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/using_phone.png',
            height: MediaQuery.of(context).size.height * .3,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 45,
            bottom: 25,
          ),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * .65,
          child: Text(
            'What kind of transaction is it?',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints size) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new _CategoryCard(
                width: size.maxWidth * .45,
                iconBgColor: Color.fromRGBO(51, 201, 255, 1),
                transactionType: TransactionTypes.Income,
                onPressed: () =>
                    this.onTransactionTypePressed(TransactionTypes.Income),
              ),
              new _CategoryCard(
                width: size.maxWidth * .45,
                iconBgColor: Theme.of(context).primaryColor,
                transactionType: TransactionTypes.Expense,
                onPressed: () =>
                    this.onTransactionTypePressed(TransactionTypes.Expense),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key key,
    @required this.width,
    @required this.iconBgColor,
    @required this.transactionType,
    @required this.onPressed,
  }) : super(key: key);

  final double width;
  final Color iconBgColor;
  final TransactionTypes transactionType;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      elevation: 2,
      child: InkWell(
        onTap: this.onPressed,
        child: Container(
          width: this.width,
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: this.iconBgColor,
                child: Icon(
                  this.transactionType == TransactionTypes.Expense
                      ? Icons.fast_forward
                      : Icons.fast_rewind,
                  color: Colors.white,
                ),
              ),
              Text(
                this.transactionType == TransactionTypes.Expense
                    ? 'Expense'
                    : 'Income',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
