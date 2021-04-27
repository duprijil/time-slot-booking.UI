import 'dart:async';
import 'package:dio/dio.dart';

class Auth {
  final String loginUrl = "https://jsonplaceholder.typicode.com/todos/1";

  Future<String> loginRequest() async {
    try {
      
      Response response = await Dio().get(loginUrl);
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
