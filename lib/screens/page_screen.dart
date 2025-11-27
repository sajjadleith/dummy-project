import 'package:flutter/material.dart';
import 'package:music_app/core/routes/app_routes.dart';
import 'package:music_app/core/widgets/custome_textfiel.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List<String> items = ["Male", "Female"];
  String? selectedValue;
  Map<String, dynamic> get data => {
    "name": nameController.text,
    "age": int.parse(ageController.text),
    "gender": selectedValue ?? "Unknown",
  };

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: padding,
              child: Text(
                "Page1",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            CustomeTextfield(
              controller: nameController,
              title: 'Enter The name',
            ),
            CustomeTextfield(controller: ageController, title: 'Enter The age'),
            Padding(
              padding: padding,
              child: DropdownButton(
                value: selectedValue,
                hint: Text("Choose a Gender"),
                items: items.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.secondRoute,
                  arguments: data,
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
