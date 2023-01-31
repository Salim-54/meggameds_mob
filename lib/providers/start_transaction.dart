import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/register.controller.dart';
import '../utils/http_exceptions.dart';

class StartTransaction with ChangeNotifier {
  EnterController credentials = Get.put(EnterController());

  // String? _token;
  // String _role = "user";
  final Dio http;

  StartTransaction(this.http);

  Future<void> transaction(String medId) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString("token");

    var token = credentials.token.value;

    if (token.isNotEmpty) {
      try {
        var response = await http.post("api/v1/transaction/${medId}",
            data: jsonEncode({}),
            options: Options(headers: {"Authorization": "Bearer $token"}));
        print(response.data);
      } on DioError catch (e) {
        print(e.response?.data["message"]);
        throw new CustomHttpException(e.response?.data["message"]);
      } catch (e) {
        rethrow;
      }
    }
  }
}
