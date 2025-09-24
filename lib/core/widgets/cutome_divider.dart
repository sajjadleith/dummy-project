import 'package:flutter/material.dart';

class CutomeDivider extends StatelessWidget {
  const CutomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Text("Or sign up with", style: TextStyle(
          fontSize: 14,
          // color: Colors.grey
        ),),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
