import 'package:flutter/material.dart';
import 'package:tmp/pages/MainPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BorderSide borderState = BorderSide(color: Colors.white, width: 1);

  String login;
  String password;

  void OnLogInButtonPressed() {
    login = loginController.text;
    password = passwordController.text;
    /*
    setState(() {
      borderState = BorderSide(color: Colors.red, width: 1);
    });*/
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
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
                      child: RaisedButton(
                        splashColor: Theme.of(context).primaryColor,
                        highlightColor: Theme.of(context).primaryColor,
                        color: Colors.white,
                        child: Text(
                          "LOGIN",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: OnLogInButtonPressed,
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
    );
  }
}
