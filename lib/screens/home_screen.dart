import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/core/widgets/sperated-list.dart';
import 'package:music_app/models/product_api_model.dart';
import 'package:music_app/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/update_provider.dart';
import '../core/app-constain.dart';
import '../core/widgets/custom-card.dart';
import 'music_screen.dart';

class HomeScreen
    extends
        StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<
    HomeScreen
  >
  createState() => _HomeScreenState();
}

class _HomeScreenState
    extends
        State<
          HomeScreen
        > {
  onTap() {
    Navigator.of(
      context,
    ).push(
      MaterialPageRoute(
        builder:
            (
              context,
            ) => MusicScreen(),
      ),
    );
  }

  Future<
    List<
      ProductApiModel
    >
  >
  getDate() async {
    final url = Uri.parse(
      "https://fakestoreapi.com/products",
    );
    final response = await http.get(
      url,
    );
    final jsonDecoded = jsonDecode(
      response.body,
    );
    final List<
      ProductApiModel
    >
    data =
        (jsonDecoded
                as List)
            .map(
              (
                item,
              ) => ProductApiModel.fromJson(
                item,
              ),
            )
            .toList();
    return data;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(
          context,
        ).size.height,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            // Image
            SizedBox(
              width: MediaQuery.of(
                context,
              ).size.width,
              height: 300,
              child: Image.asset(
                AppConstain.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            // Text on the image
            Container(
              padding: EdgeInsets.only(
                top: 80,
                left: 20,
              ),
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
                width: MediaQuery.of(
                  context,
                ).size.width,
                child: Container(
                  width: MediaQuery.of(
                    context,
                  ).size.width,
                  height:
                      MediaQuery.sizeOf(
                        context,
                      ).height -
                      220,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30,
                      ),
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
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: FutureBuilder(
                          future: getDate(),
                          builder:
                              (
                                context,
                                snapshot,
                              ) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "has error ${snapshot.error}",
                                  );
                                } else if (snapshot.hasData) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (
                                          context,
                                          index,
                                        ) {
                                          final data = snapshot.data![index];
                                          return CustomCart(
                                            title: data.title,
                                            desc: data.description,
                                            img: data.image,
                                            // Delete Product :)
                                            onTap: () async {
                                              final prov =
                                                  Provider.of<
                                                    UpdateProvider
                                                  >(
                                                    context,
                                                    listen: false,
                                                  );
                                              await prov.deleteProduct(
                                                snapshot.data![index].id,
                                              );
                                            },
                                            onChange: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (
                                                        context,
                                                      ) => ProductDetailsScreen(
                                                        id: snapshot.data![index].id,
                                                      ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                    separatorBuilder:
                                        (
                                          context,
                                          index,
                                        ) => SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: snapshot.data!.length,
                                  );
                                } else {
                                  return Text(
                                    "no data",
                                  );
                                }
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
