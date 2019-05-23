import 'package:flutter/material.dart';
import 'package:budget_planner/config/enums.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key key,
    @required this.transactionType,
  }) : super(key: key);

  final TransactionTypes transactionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
