import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  const CButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(400, 50),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        child: Text(title),
      ),
    );
  }
}
