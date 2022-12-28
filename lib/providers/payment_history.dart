import 'dart:convert';

import 'package:MMEDES/screens/settings/model/payment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../controller/register.controller.dart';
import '../screens/pharmacy/model/product.dart';
import '../utils/http_exceptions.dart';

class Transactions with ChangeNotifier {
  EnterController credentials = Get.put(EnterController());

  final Dio http;
  List<Payment> _items = [];

  Transactions(this.http);

  List<Payment> get items {
    return [..._items];
  }

  Future<void> fetchSave() async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString("token");

    var token = credentials.token.value;

    if (token.isNotEmpty) {
      try {
        List<Payment> payments = [];

        var response = await http.get("api/v1/prescriptions/user",
            options: Options(headers: {"Authorization": "Bearer $token"}));
        print(response.data['data']);

        response.data['data'].forEach((payment) {
          payments.add(Payment.fromJson(payment));
        });
        _items = payments;
        notifyListeners();
        print(payments[0]);
      } on DioError catch (e) {
        print(e);
        throw CustomHttpException(e.response!.data["message"]);
      } catch (e) {
        print(e);
      }
    }
  }
}
