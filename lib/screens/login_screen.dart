import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Register", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                Text("Create new account for better service", style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15
                ),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email and Phone number switcher
                    InkWell(
                      splashColor: Colors.deepPurple,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Email", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                          Container(
                            width: 30,
                            height: 4,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      splashColor: Colors.deepPurple,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Phone Number", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                          Container(
                            width: 100,
                            height: 4,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                // TextFormField,
                SizedBox(
                  height: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email"
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
