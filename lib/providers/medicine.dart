import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../screens/pharmacy/model/product.dart';
import '../utils/http_exceptions.dart';

class ProductsProvider with ChangeNotifier {
  final Dio http;
  List<Product> _items = [];

  ProductsProvider(this.http);

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSave() async {
    try {
      List<Product> products = [];
      final response = await http.get("api/v1/medicines");
      response.data['data']['medicines'].forEach((product) {
        products.add(Product.fromJson(product));
      });
      _items = products;
      notifyListeners();
      print(products[0].medComment);
    } on DioError catch (e) {
      print(e);
      throw CustomHttpException(e.response!.data["message"]);
    } catch (e) {
      print(e);
    }
  }

  Product findById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
