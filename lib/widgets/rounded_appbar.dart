import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget {
  const RoundedAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2.0,
      shadowColor: Colors.grey[100],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: Container(
        height: 75,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 28.0, right: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Budget Tracker', style: TextStyle(fontSize: 16)),
            Text('Sign Up',
                style: TextStyle(
                  fontSize: 12.5,
                  color: Theme.of(context).primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
