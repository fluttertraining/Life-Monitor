import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final List<Widget> textFields;
  final Function onPressed;

  CustomForm({
    Key key,
    @required this.textFields,
    @required this.onPressed,
  }) : super(key: key);

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
            GestureDetector(
              onTap: this.onPressed,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
