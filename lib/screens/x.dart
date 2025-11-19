import 'package:flutter/material.dart';
import 'package:music_app/models/product_model.dart';

class XScreen extends StatefulWidget {
  const XScreen({super.key});

  @override
  _XScreenState createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
  List<ProductModel> cartItems = [
    ProductModel(name: 'sad', img: 'd', price: 100, inStack: true, quantity: 1),
    ProductModel(
      name: 'ssdaadssdad',
      img: 'd',
      price: 200,
      inStack: true,
      quantity: 1,
    ),
    ProductModel(
      name: 'saddsads',
      img: 'd',
      price: 300,
      inStack: true,
      quantity: 1,
    ),
  ];

  void removeFromCart(ProductModel product) {
    setState(() {
      cartItems.removeWhere((item) => item.name == product.name);
    });
  }

  void incrementQuantity(ProductModel product) {
    setState(() {
      product.quantity += 1;
    });
  }

  void decrementQuantity(ProductModel product) {
    setState(() {
      if (product.quantity > 1) {
        product.quantity -= 1;
      } else {
        // optional: remove item if quantity goes below 1
        removeFromCart(product);
      }
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart (${cartItems.length})")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text("\$${item.price} x ${item.quantity}"),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => decrementQuantity(item),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => incrementQuantity(item),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeFromCart(item),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "Total: \$${getTotalPrice().toStringAsFixed(2)}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
