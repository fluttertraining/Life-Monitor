import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:budget_planner/widgets/rounded_appbar.dart';

class AuthContainer extends StatefulWidget {
  final Widget child;

  AuthContainer({
    Key key,
    @required this.child,
  });

  @override
  _AuthContainerState createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool _isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardOpen = visible;
        });
      },
    );
  }

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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: <Widget>[
                  new _LoginImage(isKeyboardOpen: _isKeyboardOpen),
                  SizedBox(height: 40),
                  widget.child,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginImage extends StatelessWidget {
  const _LoginImage({
    Key key,
    @required bool isKeyboardOpen,
  })  : _isKeyboardOpen = isKeyboardOpen,
        super(key: key);

  final bool _isKeyboardOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutExpo,
      duration: Duration(milliseconds: 500),
      alignment: _isKeyboardOpen ? Alignment.centerLeft : Alignment.center,
      margin: EdgeInsets.only(top: _isKeyboardOpen ? 75 : 40),
      height: _isKeyboardOpen ? 75 : 200,
      width: _isKeyboardOpen ? MediaQuery.of(context).size.width : 100,
      child: Image.asset('assets/images/using_phone.png'),
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
