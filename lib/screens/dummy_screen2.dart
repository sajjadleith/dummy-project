import 'package:flutter/material.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyScreen2 extends StatefulWidget {
  const DummyScreen2({super.key});

  @override
  _DummyScreen2State createState() => _DummyScreen2State();
}

class _DummyScreen2State extends State<DummyScreen2> {
  final TextEditingController textController = TextEditingController();
  String? savedValue;

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstain.username, textController.text);
    savedValue = textController.text;
    setState(() {});
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(AppConstain.username);
    if (value != null) {
      textController.text = value;
      savedValue = value;
      setState(() {});
    }
    if (value == textController.text) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

  Future<void> removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstain.username);
    savedValue = null;
    textController.text = '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Result: ${savedValue ?? ""}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter a value what every u want",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                await getData();
                loadData();
              },
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              child: Text("Submit"),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await removeData();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
