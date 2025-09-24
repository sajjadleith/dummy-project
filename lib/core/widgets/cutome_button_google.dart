import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app-constain.dart';

class CutomeButtonGoogle extends StatelessWidget {
  const CutomeButtonGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(Size(400, 50)),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(Colors.black),
            elevation: WidgetStateProperty.all(0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppConstain.google, width: 20,),
            SizedBox(width: 5,),
            Text("Continue with Google"),
          ],
        ),
      ),
    );
  }
}
