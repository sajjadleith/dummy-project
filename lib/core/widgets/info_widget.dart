import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.ico, required this.title, required this.desc});
  final String ico;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only( right: 10),
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                ico,
                colorFilter: ColorFilter.mode(
                  Color(0xffadadb6),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Color(0xffadadb6)),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Text(desc),
        ),
      ],
    );
  }
}
