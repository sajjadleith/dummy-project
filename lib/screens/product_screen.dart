import 'package:flutter/material.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/core/app_extantion.dart';
import 'package:music_app/models/product_model.dart';
import 'package:music_app/screens/cart_screen.dart';

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

  List<ProductModel> cartItem = [];
  // void _addToCart(ProductModel product) {
  //   cartItem.add(product);
  //   setState(() {});
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => CartScreen(cartItem: cartItem)),
  //   );
  // }

  void _addToCart(ProductModel product) {
    final existingProductIndex = cartItem.indexWhere(
      (p) => p.name == product.name,
    );

    if (existingProductIndex != -1) {
      cartItem[existingProductIndex] = ProductModel(
        name: cartItem[existingProductIndex].name,
        img: cartItem[existingProductIndex].img,
        price: cartItem[existingProductIndex].price,
        inStack: cartItem[existingProductIndex].inStack,
        quantity: cartItem[existingProductIndex].quantity + 1,
      );
    } else {
      cartItem.add(
        ProductModel(
          name: product.name,
          img: product.img,
          price: product.price,
          inStack: product.inStack,
          quantity: 1,
        ),
      );
    }

    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${product.name} added to cart"),
        duration: Duration(seconds: 1),
      ),
    );
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
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(AppConstain.imgs[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity: ${products[index].quantity}",
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$${products[index].price}",
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Container(
                                            width: 90,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  _addToCart(products[index]),
                                              child: Text("Add to Cart"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(cartItem: cartItem),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
