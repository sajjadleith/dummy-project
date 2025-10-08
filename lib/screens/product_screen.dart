import 'package:flutter/material.dart';
import 'package:music_app/core/app_extantion.dart';
import 'package:music_app/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> products = [
    ProductModel(
      name: "Laptop",
      img: "https://example.com/images/laptop.png",
      price: 1200.0,
      inStack: true,
      quantity: 5,
    ),
    ProductModel(
      name: "Smartphone",
      img:
          "https://thumbs.dreamstime.com/b/wildflowers-blooming-sunset-nature-scenery-wildflowers-blooming-sunset-nature-scenery-388164189.jpg?w=992",
      price: 800.0,
      inStack: true,
      quantity: 10,
    ),
    ProductModel(
      name: "Headphones",
      img:
          "https://thumbs.dreamstime.com/b/incredibly-beautiful-sunset-sun-lake-sunrise-landscape-panorama-nature-sky-amazing-colorful-clouds-fantasy-design-115177001.jpg?w=768",
      price: 150.0,
      inStack: false,
      quantity: 0,
    ),
    ProductModel(
      name: "Smartwatch",
      img:
          "https://thumbs.dreamstime.com/b/nature-forest-trees-growing-to-upward-to-sun-wallpaper-42907586.jpg?w=768",
      price: 200.0,
      inStack: true,
      quantity: 7,
    ),
    ProductModel(
      name: "Camera",
      img:
          "https://thumbs.dreamstime.com/b/concept-father-s-day-happy-family-dad-child-daughter-back-nature-park-149563964.jpg?w=768",
      price: 500.0,
      inStack: true,
      quantity: 3,
    ),
  ];

  // late Iterable<ProductModel> search = products
  //     .where(
  //       (product) => product.name.toLowerCase().contains(
  //         _searchController.text.toLowerCase(),
  //       ),
  //     )
  //     .toList();
  List<ProductModel> allProduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProduct = products;
  }

  void search(String value) {
    if (value.isNotEmpty) {
      products = products
          .where(
            (product) =>
                product.name.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    } else {
      products = allProduct;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: search,
                  decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              products.isEmpty
                  ? Text("Search For An Item")
                  : SizedBox(
                      height: context.height,
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Card(child: Text(products[index].name));
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
