import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //AnimationController _animationController;
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  //List _selectedEvents;
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.amber,
    Colors.brown,
    Colors.yellow,
    Colors.blue,
  ];
  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  Scaffold calendarPage() {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: <Widget>[
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

  Scaffold listPage() {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Text("Hello"),
        ],
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        calendarPage(),
        listPage(),
      ],
    );
    /*
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      
      itemBuilder: (BuildContext context, int pos) {
        return PageView(
          controller: _pageController,
          children: [
            calendarPage(),
            listPage(),
          ],
        );
      },
      itemCount: 2,
    );*/
  }

  Widget buildExampleIndicatorWithShapeAndBottomPos(
      Shape shape, double bottomPos) {
    return Positioned(
      bottom: bottomPos,
      left: 0,
      right: 0,
      child: WormIndicator(
        length: 2,
        controller: _pageController,
        shape: shape,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildPageView(),
          buildExampleIndicatorWithShapeAndBottomPos(
              Shape(
                size: 16,
                shape: DotShape.Circle,
                spacing: 8,
              ),
              20),
        ],
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
