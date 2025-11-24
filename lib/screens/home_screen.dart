import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/controllers/product_provider.dart';
import 'package:music_app/core/widgets/sperated-list.dart';
import 'package:music_app/models/product_api_model.dart';
import 'package:provider/provider.dart';

import '../core/app-constain.dart';
import '../core/widgets/custom-card.dart';
import 'music_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onTap() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MusicScreen()));
  }

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
    super.initState();
  }

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
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            // Image
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(AppConstain.thumbnail, fit: BoxFit.cover),
            ),
            // Text on the image
            Container(
              padding: EdgeInsets.only(top: 80, left: 20),
              child: Text(
                "Selamat Pagi, Julio",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height + 100,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.sizeOf(context).height - 220,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 5,
                          ),
                          child: Text(
                            "Aktivias Terakhir",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SperatedList(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rekomendasi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Lihat Lebih",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Consumer<ProductProvider>(
                          builder: (context, prov, child) {
                            if (prov.filteredProduct.isEmpty) {
                              return Center(child: Text("No Products"));
                            }

                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: prov.filteredProduct.length,
                              itemBuilder: (context, index) {
                                final data = prov.filteredProduct[index];
                                return CustomCart(
                                  title: data.title,
                                  desc: data.description,
                                  img: data.image,
                                  onTap: () {},
                                  onChange: () {},
                                );
                              },
                              separatorBuilder: (_, __) => SizedBox(height: 10),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
