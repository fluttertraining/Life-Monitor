import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:budget_planner/widgets/custom_textfield.dart';
import 'package:budget_planner/widgets/custom_form.dart';
import 'package:budget_planner/widgets/rounded_appbar.dart';
import 'package:budget_planner/widgets/zoom_in_out_image.dart';

class AddBankScreen extends StatefulWidget {
  @override
  _AddBankScreenState createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
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
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 0),
        child: Container(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          new _AppBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: ListView(
                children: <Widget>[
                  ZoomInOutImage(
                    height: 175,
                    child: new _AddBankImage(isKeyboardOpen: _isKeyboardOpen),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 50),
                    padding: EdgeInsets.only(right: 25),
                    child: Text(
                      'Add primary bank account',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  new _AddBankForm(
                    onSubmit: () {
                      Navigator.of(context).pushNamed('/add-bank-success');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AddBankImage extends StatelessWidget {
  const _AddBankImage({
    Key key,
    @required bool isKeyboardOpen,
  })  : _isKeyboardOpen = isKeyboardOpen,
        super(key: key);

  final bool _isKeyboardOpen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Image.asset(
          'assets/images/bank.png',
          height: 200,
          filterQuality: FilterQuality.high,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutExpo,
          top: _isKeyboardOpen ? -10 : -25,
          right: _isKeyboardOpen ? -25 : -50,
          child: Image.asset(
            'assets/images/add_circle.png',
            height: _isKeyboardOpen ? 50 : 115,
            width: _isKeyboardOpen ? 50 : 115,
            filterQuality: FilterQuality.high,
          ),
        )
      ],
    );
  }
}

class _AddBankForm extends StatelessWidget {
  const _AddBankForm({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: CustomForm(
        onPressed: this.onSubmit,
        textFields: <Widget>[
          new CustomTextField(
            placeholder: 'Account name here',
            label: 'Account Name',
          ),
          new CustomTextField(
            placeholder: '\$0,000',
            label: 'Starter Amount',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RoundedAppBar(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          height: 85,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(width: 10),
              Text(
                'Add account',
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
