import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  BorderSide borderState = BorderSide(color: Colors.white, width: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Align(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 30, top: 40),
                      child: TextField(
                        //controller: loginController,
                        obscureText: false,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "login",
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
                        //controller: loginController,
                        obscureText: false,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "name",
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
                          hintText: "birthdaty",
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
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        //controller: passwordController,
                        obscureText: true,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "password",
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
                              child: Icon(Icons.security),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
                    SizedBox(
                      height: 20,
                    ),
/*--------------------------------------------------------------*/
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        //controller: passwordController,
                        obscureText: true,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          hintText: "repeat password",
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
                              child: Icon(Icons.security),
                            ),
                          ),
                        ),
                      ),
                      width: 200,
                    ),
                    SizedBox(
                      height: 20,
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
                            "REGISTER",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: onRegisterButtonPressed,
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

  void onRegisterButtonPressed() {
    Navigator.of(context).pop();
  }

  void onDateTextFieldTap(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
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
