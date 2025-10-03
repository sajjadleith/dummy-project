import 'package:flutter/material.dart';

class CustomeTextfield extends StatefulWidget {
  const CustomeTextfield({
    super.key,
    required this.controller,
    required this.title,
  });
  final TextEditingController controller;
  final String title;

  @override
  _CustomeTextfieldState createState() => _CustomeTextfieldState();
}

class _CustomeTextfieldState extends State<CustomeTextfield> {
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
    return Container(
      padding: padding,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: widget.title,
        ),
      ),
    );
  }
}
