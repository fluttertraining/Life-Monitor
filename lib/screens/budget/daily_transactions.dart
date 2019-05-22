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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                margin: EdgeInsets.only(bottom: 24),
                child: true
                    ? new _TransactionList()
                    : new _EmptyState(isSelecting: _isSelecting),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  const _TransactionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 32),
      itemCount: 7,
      itemBuilder: (BuildContext context, int ndx) {
        return new _TransactionItem();
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/pill.png',
            height: 50,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 15),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints size) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Paper Bags',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$340.40",
                            style: TextStyle(
                              color: Color.fromRGBO(25, 234, 37, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.5),
                      Text(
                        'Fri 10AM',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        width: size.maxWidth,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    Key key,
    @required bool isSelecting,
  })  : _isSelecting = isSelecting,
        super(key: key);

  final bool _isSelecting;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
