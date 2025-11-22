import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_app/controllers/update_provider.dart';
import 'package:music_app/core/widgets/custome_textfiel.dart';
import 'package:music_app/models/product_api_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int id;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final TextEditingController titleController = TextEditingController();
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
        child: Selector<UpdateProvider, ProductApiModel?>(
          builder: (context, updateProvider, child) {
            return Column(
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
                            updateProvider?.title ?? snapshot.data!.title,
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
                          SizedBox(height: 30),
                          CustomeTextfield(controller: titleController, title: "Update Title"),
                          ElevatedButton(
                            onPressed: () {
                              context.read<UpdateProvider>().updateTitle(
                                widget.id,
                                titleController.text,
                              );
                            },
                            child: Center(child: Text("Submit")),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text("no data"));
                    }
                  },
                ),
              ],
            );
          },
          selector: (context, prov) => prov.product,
        ),
      ),
    );
  }
}
