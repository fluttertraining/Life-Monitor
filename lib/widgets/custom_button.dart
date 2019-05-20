import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// The app's custom implementation on how a button should
  /// look like
  CustomButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final String text;
  final Function onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          width: this.width,
          height: this.height,
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
