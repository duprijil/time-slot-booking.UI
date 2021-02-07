import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class Auth {
  //final dynamic loginUrl = "http://127.0.0.1:5000/login";

  Future<String> loginRequest() async {
    try {
      Response response = await Dio().get("http://google.com");
      print("super");
    } catch (e) {
      print(e);
    }
  }
}
