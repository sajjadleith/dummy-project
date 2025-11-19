import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/api_app/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<UserDetailsScreen> createState() => _DummyForApiScreenState();
}

class _DummyForApiScreenState extends State<UserDetailsScreen> {
  late Uri uri;
  Future<UserModel> getData() async {
    var response = await http.get(uri);
    var jsonBody = jsonDecode(response.body);
    final data = UserModel.fromJson(jsonBody);
    return data;
    print(data.company.catchPhrase);
  }

  @override
  void initState() {
    uri = Uri.parse("https://jsonplaceholder.typicode.com/users/${widget.id}");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("has error ${snapshot.error}");
          } else if (snapshot.hasData) {
            return Center(child: Text("data = ${snapshot.data!.name}"));
          } else {
            return Text("zarbaaa");
          }
        },
      ),
    );
  }
}
