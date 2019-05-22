import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'package:budget_planner/widgets/rounded_appbar.dart';

class DailyTransactionsScreen extends StatefulWidget {
  @override
  _DailyTransactionsScreenState createState() =>
      _DailyTransactionsScreenState();
}

class _DailyTransactionsScreenState extends State<DailyTransactionsScreen> {
  DateTime _currentDate;
  bool _isSelecting = false;

  void _onDayPressed(DateTime date, _) {
    this.setState(() {
      _currentDate = date;
      _isSelecting = true;
    });
  }

  void _onHeaderTitlePressed() {
    this.setState(() {
      _isSelecting = !_isSelecting;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: 'GT-Walshiem-Pro',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Daily Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          RoundedAppBar(
            padding: EdgeInsets.symmetric(horizontal: 10),
            isAnimated: true,
            height:
                _isSelecting ? MediaQuery.of(context).size.height * .60 : 120,
            child: CalendarCarousel(
              onDayPressed: _onDayPressed,
              onHeaderTitlePressed: _onHeaderTitlePressed,
              weekendTextStyle: TextStyle(
                color: Colors.black,
              ),
              headerTitleTouchable: true,
              iconColor: Theme.of(context).primaryColor,
              weekFormat: !_isSelecting,
              selectedDateTime: _currentDate,
              todayButtonColor: Colors.grey[100],
              todayTextStyle: textStyle.copyWith(color: Colors.black),
              selectedDayButtonColor: Theme.of(context).primaryColor,
              selectedDayTextStyle: textStyle.copyWith(color: Colors.white),
              daysTextStyle: textStyle,
              weekdayTextStyle: textStyle.copyWith(color: Colors.grey[400]),
              nextDaysTextStyle: textStyle,
              headerTextStyle: textStyle.copyWith(color: Colors.black),
              showHeader: _isSelecting,
              weekDayMargin: EdgeInsets.only(
                top: _isSelecting ? 0 : 20,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSelecting = false;
                });
              },
              child: ListView(
                physics: !_isSelecting ? null : NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 25),
                children: <Widget>[
                  Image.asset(
                    'assets/images/no_transaction_yet.png',
                    height: MediaQuery.of(context).size.height * .30,
                    filterQuality: FilterQuality.high,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'No transaction yet',
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(height: 17.5),
                      Text(
                        'You can add transaction by tapping the',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 7.5),
                      Text(
                        '+ button below',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 25.5),
                      Image.asset(
                        'assets/images/line_down.png',
                        height: 65,
                        filterQuality: FilterQuality.high,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
