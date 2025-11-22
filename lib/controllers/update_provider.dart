import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/models/product_api_model.dart';

class UpdateProvider extends ChangeNotifier {
  ProductApiModel? product;
  Future<void> updateTitle(int id, String newTitle) async {
    final url = Uri.parse("https://fakestoreapi.com/products/${id}");
    final data = jsonEncode({"title": newTitle});
    final response = await http.put(url, headers: {"Content-Type": "application/json"}, body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final updatedTitle = ProductApiModel.fromJson(jsonData);
      product = updatedTitle;
      notifyListeners();
    } else {
      throw Exception("Failed to get data ${response.statusCode}");
    }
    print(response.body);
  }
}
