import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key, required this.ico, required this.text});
  final String ico;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 50,
        height: 40,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(color: Colors.grey)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ico),
            Text(text)
          ],
        ),
      ),
    );
  }
}
