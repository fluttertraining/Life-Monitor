import 'package:flutter/material.dart';

class AddBankSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/images/confetti.png',
                    height: 175,
                    width: MediaQuery.of(context).size.width,
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(height: 40),
                  Text('Congratulations!',
                      style: Theme.of(context).textTheme.title),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text(
                      'Your bank account is added successfully to the app!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
