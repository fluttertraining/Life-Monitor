import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/auth_container.dart';
import 'package:budget_planner/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Login to your account',
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          new _LoginForm(),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new CustomTextField(
              placeholder: 'name@domain.com',
              label: 'Email',
            ),
            Row(
              children: <Widget>[
                new CustomTextField(
                  placeholder: '************',
                  label: 'Password',
                  password: true,
                ),
                SizedBox(width: 40),
                Container(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
