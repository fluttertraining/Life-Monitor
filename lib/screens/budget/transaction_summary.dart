import 'package:flutter/material.dart';

class TransactionSummary extends StatefulWidget {
  @override
  _TransactionSummaryState createState() => _TransactionSummaryState();
}

class _TransactionSummaryState extends State<TransactionSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trasaction Summary Screen'),
      ),
      body: Center(
        child: Text('Trasaction Summary Screen'),
      ),
    );
  }
}
