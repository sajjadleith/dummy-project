import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/core/widgets/custom_product_cart.dart';
import 'package:music_app/models/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<ProductModel> cartItem;
  const CartScreen({super.key, required this.cartItem});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController _discountController = TextEditingController();
  double discount = 0.0;
  Map<String, double> discountCodes = {"sajjad": 0.25, "ali": 0.50};
  void applyDiscount() {
    String code = _discountController.text.trim().toLowerCase();
    if (discountCodes.containsKey(code)) {
      discount = discountCodes[code]!;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${(discount * 100).toStringAsFixed(0)}% discount applied",
          ),
        ),
      );
    } else {
      discount = 0;
      setState(() {});
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Wrong discount code")));
    }
  }

  double _getSubTotalPrice() {
    double total = 0;
    for (var item in widget.cartItem) {
      total += item.price * item.quantity;
    }
    return total;
  }

  double _getTotalPrice() {
    double subTotal = _getSubTotalPrice();
    double total = subTotal - (subTotal * discount);
    return total < 0 ? 0 : total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Ink(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(AppConstain.backArrow),
                      ),
                    ),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Ink(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(AppConstain.cart),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 350,
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemCount: widget.cartItem.length,
                itemBuilder: (context, index) {
                  final product = widget.cartItem[index];
                  return Dismissible(
                    key: Key(product.name),
                    direction: DismissDirection.endToStart,

                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        AppConstain.remove,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      widget.cartItem.removeAt(index);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${product.name} is deleted")),
                      );
                    },
                    child: CustomProductCart(
                      name: product.name,
                      quantity: product.quantity,
                      price: product.price,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                // height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _discountController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: "Enter Discount Code",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 7,
                        ),
                        suffix: Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: applyDiscount,
                            child: Text("Apply"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sub total:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "\$${_getSubTotalPrice()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "${(discount * 100).toStringAsFixed(0)}%",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 20,
                      indent: 0,
                      endIndent: 0,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "total: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "\$${_getTotalPrice()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Icon(Icons.fast_forward)),
                          ),

                          Text(
                            "Checkout",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
