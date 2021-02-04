import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AnimationController _animationController;
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      drawer: Drawer(
        child: Scaffold(
          //padding: EdgeInsets.zero,
          body: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("LogOut"),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 100)),
            TableCalendar(
              calendarController: _calendarController,
              events: _events,
              startingDayOfWeek: StartingDayOfWeek.monday,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("LogOut"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    //_animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }
}
