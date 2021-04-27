import 'package:flutter/material.dart';
import 'package:time_slot_booking/pages/LoginPage.dart';

void main() => runApp(TimeSlotBooking());

/*
ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[500],
          primaryColorBrightness: Brightness.light,
          accentColor: Colors.pinkAccent[200],
          accentColorBrightness: Brightness.light),
*/

class TimeSlotBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Slot Booking',
      theme: ThemeData.light(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
