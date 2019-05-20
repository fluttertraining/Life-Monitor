import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/rounded_appbar.dart';
import 'package:budget_planner/widgets/zoom_in_out_image.dart';

class AuthContainer extends StatefulWidget {
  /// A widget that wraps the [LoginScreen] and [RegisterScreen]
  /// The [child] usually contains the text and form elements
  AuthContainer({
    Key key,
    @required this.child,
    @required this.onTapHeaderAction,
    this.isLogin = false,
  });

  /// Should have a list of [CustomTextField] with a wrapper component such as
  /// a [SizedBox] or [Container]
  final Widget child;

  /// Determines the if the facebook button and header
  /// should say signup / sign in
  final bool isLogin;

  final Function onTapHeaderAction;

  @override
  _AuthContainerState createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
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
                GestureDetector(
                  onTap: widget.onTapHeaderAction,
                  child: Text(
                    widget.isLogin ? 'Sign Up' : 'Login',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: <Widget>[
                  new ZoomInOutImage(
                      assetName: 'assets/images/using_phone.png'),
                  SizedBox(height: 40),
                  widget.child,
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.only(bottom: 40),
                    height: 160,
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
                        new _FacebookButton(isLogin: widget.isLogin),
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

class _FacebookButton extends StatelessWidget {
  final bool isLogin;

  const _FacebookButton({Key key, this.isLogin}) : super(key: key);

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
            this.isLogin ? 'Login with facebook' : 'Signup with facebook',
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
