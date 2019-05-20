import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/auth_container.dart';
import 'package:budget_planner/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToRegisterScreen() {
      Navigator.of(context).pushReplacementNamed('/');
    }

    return AuthContainer(
      onTapHeaderAction: _navigateToRegisterScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign up to Budget tracker',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 20),
          Text(
            'Keep your finantial data store to our server so that you can access from anywhere you want',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 25),
          new _RegisterForm(),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new CustomTextField(
            placeholder: 'Your name',
            label: 'Your name',
          ),
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
    );
  }
}
