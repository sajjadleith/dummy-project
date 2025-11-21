import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/models/product_api_model.dart';
import 'package:music_app/screens/product_details_screen.dart';

import '../app-constain.dart';

class SperatedList extends StatefulWidget {
  const SperatedList({super.key});

  @override
  State<SperatedList> createState() => _SperatedListState();
}

class _SperatedListState extends State<SperatedList> {
  Future<List<ProductApiModel>> getDate() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    final jsonDecoded = jsonDecode(response.body);
    final List<ProductApiModel> data = (jsonDecoded as List)
        .map((item) => ProductApiModel.fromJson(item))
        .toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: FutureBuilder(
          future: getDate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("an error has occurred ${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: NetworkImage(data.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: SizedBox(
                            width: 120,
                            child: Text(
                              data.category,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Text("no data");
            }
          },
        ),
      ),
    );
  }
}
