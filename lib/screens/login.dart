import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:budget_planner/widgets/rounded_appbar.dart';
import 'package:budget_planner/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 0),
        child: Container(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new RoundedAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Budget Tracker', style: TextStyle(fontSize: 16)),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 40),
                  height: 200,
                  child: Image.asset('assets/images/using_phone.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 28),
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
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'or',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            new _FacebookButton(),
                            Text('Forgot Password?')
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FacebookButton extends StatelessWidget {
  const _FacebookButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(59, 89, 152, 1.0),
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset('assets/icons/fb.png'),
          ),
          Text(
            'Login with facebook',
            style: TextStyle(
              color: Color.fromRGBO(59, 89, 152, 1.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container()
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
