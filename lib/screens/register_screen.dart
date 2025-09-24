import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/screens/login_screen.dart';

import '../core/widgets/custome_email.dart';
import '../core/widgets/cutome_button.dart';
import '../core/widgets/cutome_button_google.dart';
import '../core/widgets/cutome_divider.dart';
import '../core/widgets/cutome_textform.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  bool isActive = false;

  TextStyle _textStyle() {
    return TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFBFE),
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
                SizedBox(height: 20),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Create new account for better service",
                  style: TextStyle(color: Colors.grey[800], fontSize: 15),
                ),
                SizedBox(height: 20),
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
                          Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 4,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      splashColor: Colors.deepPurple,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
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
                SizedBox(height: 30),
                Text(
                  "Email Address",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                // TextFormField,
                CustomeEmail(),
                SizedBox(height: 5),
                CutomeTextform(title: "Password"),
                CutomeTextform(title: "Confirm Password"),
                SizedBox(height: 5),
                // Term & Condition and Privacy
                Container(
                  // width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isActive,
                        onChanged: (bool? isActive) {
                          if (isActive == null) {
                            return;
                          }
                          this.isActive = isActive;

                          setState(() {});
                        },
                        activeColor: Colors.deepPurple,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "I agree to the "),
                              TextSpan(text: "Term", style: _textStyle()),
                              TextSpan(text: " & "),
                              TextSpan(text: "Condition", style: _textStyle()),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy",
                                style: _textStyle(),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                CButton(title: 'Sign up', onPressed: () {}),
                SizedBox(height: 20),
                CutomeDivider(),
                SizedBox(height: 30),
                CutomeButtonGoogle(),
                SizedBox(height: 30),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: "Sign in",
                          style: _textStyle(),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                        ),
                      ],
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
