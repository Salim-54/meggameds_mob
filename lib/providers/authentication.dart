import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/http_exceptions.dart';

class AuthProvider with ChangeNotifier {
  // String? _token;
  // String _role = "user";
  final Dio http;

  AuthProvider(this.http);

  // bool get isAuth {
  //   print(token != null);
  //   return token != null;
  // }

  // String get role {
  //   return _role;
  // }

  // String? get token {
  //   if (_token != null && _token!.isNotEmpty) return _token;
  //   return null;
  // }

  Future<void> _authenticate(String token, String user) async {
    print("Token");
    print(user);
    print(token);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    // prefs.setString("user", user);
    // _token = token;
    // _role = role;
    notifyListeners();
  }

  Future<String> login(String username, String password) async {
    try {
      final response = await http.post("/user/signin",
          data: jsonEncode({
            "password": password,
            "email": username,
          }));
      print("Login");
      print(response.data);
      _authenticate(
          response.data["data"]["token"], response.data["data"]["role"]);
      return response.data["data"]["role"].toString();
    } on DioError catch (e) {
      print(e.response?.data["message"]);
      throw new CustomHttpException(e.response?.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String firstName, String lastName, String email,
      String phoneNumber, String password) async {
    try {
      print(http.options.baseUrl);
      var data = jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": "25" + phoneNumber,
        "password": password,
      });
      print(data);
      final response = await http.post("auth/signup", data: data);
      print("Registered");
      print(response);
      // _authenticate(
      //   response.data["token"],
      //   response.data["user"],
      // );
    } on DioError catch (e) {
      print(e.response?.data["message"]);
      throw new CustomHttpException(e.response?.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> logout() async {
  //   _token = null;
  //   notifyListeners();
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove("token");
  //   prefs.remove("role");
  //   prefs.clear();
  // }

  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey("token") || !prefs.containsKey("role")) return false;
  //   final extractedToken = prefs.getString("token");
  //   final extractedRole = prefs.getString("role");

  //   _token = extractedToken;
  //   _role = extractedRole!;
  //   notifyListeners();
  //   return true;
  // }
}
