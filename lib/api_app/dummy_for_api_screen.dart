import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_app/api_app/user_details_screen.dart';
import 'package:music_app/api_app/user_model.dart';
import "package:http/http.dart" as http;

class DummyForApiScreen extends StatefulWidget {
  const DummyForApiScreen({super.key});

  @override
  _DummyForApiScreenState createState() => _DummyForApiScreenState();
}

class _DummyForApiScreenState extends State<DummyForApiScreen> {
  Future<List<UserModel>> getData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users/");
    final response = await http.get(url);
    final jsonDecoded = jsonDecode(response.body);
    final List<UserModel> data = (jsonDecoded as List).map((e) => UserModel.fromJson(e)).toList();
    return data;
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.email),
                  leading: CircleAvatar(child: Text(data.id.toString())),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) =>
                            UserDetailsScreen(id: snapshot.data![index].id.toString()),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Text("no data");
          }
        },
      ),
    );
  }
}
