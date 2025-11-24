import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/product_api_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductApiModel> allProduct = [];
  List<ProductApiModel> filteredProduct = [];
  bool isLoaded = false;

  void setProduct(List<ProductApiModel> data) {
    if (!isLoaded) {
      allProduct = data;
      filteredProduct = List.from(allProduct);
      isLoaded = true;
      notifyListeners();
    }
  }

  void filteredByCategory(String category) {
    filteredProduct = allProduct.where((p) => p.category == category).toList();
    notifyListeners();
  }

  Future<void> loadProducts() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    final jsonDecoded = jsonDecode(response.body);

    allProduct = (jsonDecoded as List)
        .map((item) => ProductApiModel.fromJson(item))
        .toList();

    filteredProduct = List.from(allProduct);
    notifyListeners();
  }
}
