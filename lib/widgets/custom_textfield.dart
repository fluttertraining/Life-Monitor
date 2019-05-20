import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.placeholder,
    @required this.label,
    this.password = false,
    this.keyboardType,
  }) : super(key: key);

  final String placeholder;
  final String label;
  final bool password;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.label,
            style: Theme.of(context).textTheme.subtitle.copyWith(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
          ),
          CupertinoTextField(
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.25,
                ),
              ),
            ),
            placeholder: this.placeholder,
            placeholderStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.grey[400],
            ),
            style: TextStyle(
              fontFamily: 'GT-Walshiem-Pro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            obscureText: this.password,
            keyboardType: this.keyboardType,
          ),
        ],
      ),
    );
  }
}
