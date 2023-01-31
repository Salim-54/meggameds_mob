import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/register.controller.dart';
import '../utils/http_exceptions.dart';

class AuthProvider with ChangeNotifier {
  EnterController credentials = Get.put(EnterController());

  String? _token;
  // String _role = "user";
  final Dio http;

  AuthProvider(this.http);

  bool get isAuth {
    print(token != null);
    return token != null;
  }

  // String get role {
  //   return _role;
  // }

  String? get token {
    if (_token != null && _token!.isNotEmpty) return _token;
    return null;
  }

  Future<void> _authenticate(String token) async {
    print("Token");
    // print(user);
    print(token);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    // prefs.setString("user", user);
    _token = token;
    // _role = role;
    notifyListeners();
  }

  Future<Map> login(String username, String password) async {
    try {
      final response = await http.post("auth/signin",
          data: jsonEncode({
            "password": password,
            "email": username,
          }));
      print("Login");
      print(response.data);
      _authenticate(response.data["token"]);
      print(response.data["token"]);
      return response.data;
    } on DioError catch (e) {
      print(e.response?.data["message"]);
      throw new CustomHttpException(e.response?.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> register(String firstName, String lastName, String email,
      String phoneNumber, String password) async {
    try {
      final response = await http.post(
        "auth/signup",
        data: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": "25" + phoneNumber,
          "password": password,
        }),
      );
      _authenticate(response.data["token"]);
      print(response.data["token"]);
      return response.data;
    } on DioError catch (e) {
      print(e.response?.data["message"]);
      throw new CustomHttpException(e.response?.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    _token = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    credentials.email.value = '';
    credentials.l_name.value = '';
    credentials.phone.value = '';
    credentials.f_name.value = '';
    credentials.token.value = '';
    credentials.id.value = '';

    prefs.clear();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("token")) return false;
    final extractedToken = prefs.getString("token");

    _token = extractedToken;

    notifyListeners();
    return true;
  }
}
