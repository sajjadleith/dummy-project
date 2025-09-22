import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: SizedBox(
                  height: 100,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "Hello Ali",filled: true,fillColor: Colors.blue),
                  ),
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(child: Text("data $index")),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
