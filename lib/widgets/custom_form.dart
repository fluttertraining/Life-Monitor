import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/custom_button.dart';

class CustomForm extends StatelessWidget {
  /// A widget that transforms a list of renders the list
  /// of [CustomTextField] but the last textField gets wrapped in a
  /// a row with a button
  CustomForm({
    Key key,
    @required this.textFields,
    @required this.onPressed,
  }) : super(key: key);

  final List<Widget> textFields;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final lastTextField = textFields.removeAt(textFields.length - 1);

    return Column(
      children: <Widget>[
        for (Widget textField in textFields) textField,
        Row(
          children: <Widget>[
            lastTextField,
            SizedBox(width: 40),
            CustomButton(
              onTap: this.onPressed,
              height: 45,
              width: 45,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 36,
              ),
            ),
          ],
        )
      ],
    );
  }
}
