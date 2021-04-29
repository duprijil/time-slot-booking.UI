import 'package:flutter/material.dart';
import 'package:time_slot_booking/models/Auth.dart';
import 'package:time_slot_booking/pages/MainPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_slot_booking/pages/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth _auth = Auth();
  BorderSide borderState = BorderSide(color: Colors.white, width: 1);

  String login;
  String password;

  void onLogInButtonPressed() {
    login = loginController.text;
    password = passwordController.text;

    _auth.loginRequest().then((value) {
      if (value != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Fluttertoast.showToast(
            msg: "Wrong credentials",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3);
        setState(() {
          borderState = BorderSide(color: Colors.red, width: 1);
        });
      }
    });
  }

  void onRegisterButtonPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    //double _heigth = MediaQuery.of(context).size.height;

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
                    "Time Slot Booking",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
/*--------------------------------------------------------------*/
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 30, top: 100),
                      child: TextField(
                        controller: loginController,
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
                        controller: passwordController,
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
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          splashColor: Theme.of(context).primaryColor,
                          highlightColor: Theme.of(context).primaryColor,
                          color: Colors.white,
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: onLogInButtonPressed,
                        ),
                      ),
                    ),
/*--------------------------------------------------------------*/
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        // ignore: deprecated_member_use
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
}
