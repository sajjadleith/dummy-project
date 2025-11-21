import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_app/models/product_api_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int id;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Future<ProductApiModel> getData() async {
    final url = Uri.parse("https://fakestoreapi.com/products/${widget.id}");
    final response = await http.get(url);
    final decodedData = jsonDecode(response.body);
    final data = ProductApiModel.fromJson(decodedData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Data has an error ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(image: NetworkImage(snapshot.data!.image)),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text("no data"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
