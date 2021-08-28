import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token = '';
  String _email = '';

  String get email {
    return _email.toString();
  }

  bool get isAuth {
    if (_token != '')
      return true;
    else
      return false;
  }

  Future<void> logout() async {
    _token = '';
    _email = '';
    Future.delayed(Duration(seconds: 0));
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    if (response.statusCode >= 400) {
      throw HttpException('Error, please try again');
    }
    final jsonData = jsonDecode(response.body) as Map<String,
        dynamic>; 
    _token = jsonData['token']; 
    _email = email;
    notifyListeners();
  }
}
