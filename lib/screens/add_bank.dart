import 'package:flutter/material.dart';

import 'package:budget_planner/widgets/rounded_appbar.dart';

class AddBankScreen extends StatelessWidget {
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
    return RoundedAppBar(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      height: 85,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          Text(
            'Add account',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
