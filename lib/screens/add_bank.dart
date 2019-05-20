import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/custom_textfield.dart';
import 'package:budget_planner/widgets/custom_form.dart';
import 'package:budget_planner/widgets/rounded_appbar.dart';
import 'package:budget_planner/widgets/zoom_in_out_image.dart';

class AddBankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 0),
        child: Container(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          new _AppBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: <Widget>[
                  ZoomInOutImage(
                    assetName: 'assets/images/bank.png',
                    height: 175,
                  ),
                  new _AddBankForm(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AddBankForm extends StatelessWidget {
  const _AddBankForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: CustomForm(
        onPressed: () {},
        textFields: <Widget>[
          new CustomTextField(
            placeholder: 'Account name here',
            label: 'Account Name',
          ),
          new CustomTextField(
            placeholder: '\$0,000',
            label: 'Starter Amount',
          ),
        ],
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
    return Column(
      children: <Widget>[
        RoundedAppBar(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          height: 85,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              SizedBox(width: 10),
              Text(
                'Add account',
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
