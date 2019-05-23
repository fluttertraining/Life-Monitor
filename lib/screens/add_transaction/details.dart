import 'package:flutter/material.dart';

import 'package:budget_planner/config/enums.dart';
import 'package:budget_planner/widgets/custom_form.dart';
import 'package:budget_planner/widgets/custom_textfield.dart';

class TransactionDetails extends StatefulWidget {
  TransactionDetails({
    Key key,
    @required this.transactionType,
  }) : super(key: key);

  final TransactionTypes transactionType;

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  FocusNode focusNode;
  bool hasBeenFocused = false;

  @override
  void initState() {
    super.initState();

    this.focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String type;
    IconData icon;
    Color iconColor;

    if (!hasBeenFocused) {
      FocusScope.of(context).requestFocus(focusNode);

      setState(() {
        hasBeenFocused = true;
      });
    }

    if (this.widget.transactionType == TransactionTypes.Expense) {
      type = 'Expense';
      icon = Icons.fast_forward;
      iconColor = Theme.of(context).primaryColor;
    } else {
      type = 'Income';
      icon = Icons.fast_rewind;
      iconColor = Color.fromRGBO(51, 201, 255, 1);
    }

    return Container(
      margin: EdgeInsets.only(
        top: 24,
        bottom: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              new _TransactionType(
                icon: icon,
                iconColor: iconColor,
                type: type,
              ),
            ],
          ),
          CustomForm(
            onPressed: () {},
            textFields: <Widget>[
              CustomTextField(
                label: 'Payee Name',
                placeholder: 'Cereal & Milk',
                focusNode: this.focusNode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionType extends StatelessWidget {
  const _TransactionType({
    Key key,
    @required this.icon,
    @required this.iconColor,
    @required this.type,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          backgroundColor: iconColor,
        ),
        SizedBox(width: 15),
        SizedBox(
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Transaction Type'),
              Text(
                type,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
