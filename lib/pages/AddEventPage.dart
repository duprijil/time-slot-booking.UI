import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_slot_booking/models/Service.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  BorderSide borderState = BorderSide(color: Colors.white, width: 1);

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController serviceAddressController = TextEditingController();
  TextEditingController serviceDealerNameController = TextEditingController();

  TextEditingController timeCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
/*--------------------------------------------------------------*/
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Align(
                        child: Text(
                          "Add service",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 20, top: 40),
                      child: TextField(
                        controller: serviceNameController,
                        obscureText: false,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "service name",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: borderState),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(Icons.room_service),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 30, top: 10),
                      child: TextField(
                        controller: serviceAddressController,
                        obscureText: false,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "address",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: borderState),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(Icons.login),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        controller: serviceDealerNameController,
                        obscureText: false,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "dealer name",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: borderState),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(Icons.face),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingController,
                        obscureText: false,
                        style: TextStyle(),
                        onTap: () {
                          onDateTextFieldTap(context);
                        },
                        decoration: InputDecoration(
                          hintText: "date",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: borderState),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(Icons.date_range),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: timeCtl,
                        obscureText: false,
                        style: TextStyle(),
                        onTap: () {
                          onAddTimeButtonClick(context);
                        },
                        decoration: InputDecoration(
                          hintText: "time",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: borderState),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: IconTheme(
                              data: IconThemeData(color: Colors.white),
                              child: Icon(Icons.timer),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
/*--------------------------------------------------------------*/
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: RaisedButton(
                          splashColor: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColor,
                          color: Colors.white,
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: onAddButtonClick,
                        ),
                      ),
                    ),

/*--------------------------------------------------------------*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onAddTimeButtonClick(BuildContext context) async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(context).requestFocus(new FocusNode());

    TimeOfDay picked =
        await showTimePicker(context: context, initialTime: time);
    if (picked != null && picked != time) {
      var now = DateTime.now();
      var dt =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      timeCtl.text = DateFormat.Hm().format(dt);
      setState(() {
        time = picked;
      });
    }
  }

  void onAddButtonClick() {
    if (serviceAddressController.text.isEmpty ||
        serviceNameController.text.isEmpty ||
        _textEditingController.text.isEmpty ||
        serviceDealerNameController.text.isEmpty) {
      Navigator.pop(context);
      return;
    }
    Service newService = Service(
        address: serviceAddressController.text,
        name: serviceNameController.text,
        date: _textEditingController.text,
        serverProviderFullName: serviceDealerNameController.text,
        time: timeCtl.text);
    Navigator.pop(context, newService);
    //Navigator.of(context).pop();
  }

  void onDateTextFieldTap(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: Theme.of(context),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
