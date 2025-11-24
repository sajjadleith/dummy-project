import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:music_app/api_app/dummy_for_api_screen.dart';
import 'package:music_app/screens/register_screen.dart';

import '../core/widgets/custome_email.dart';
import '../core/widgets/cutome_button.dart';
import '../core/widgets/cutome_button_google.dart';
import '../core/widgets/cutome_divider.dart';
import '../core/widgets/cutome_phone.dart';
import '../core/widgets/cutome_textform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  bool isActive = false;
  int selectedIndex = 0;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>(); // form key :)
  final TextEditingController emailController = TextEditingController(
    text: "johndss",
  );
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(
    text: "m38rmF\$",
  );
  late List<Widget> element = [
    CustomeEmail(controller: emailController),
    CutomePhone(controller: phoneController),
  ];

  TextStyle _textStyle() {
    return TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    );
  }

  final url = Uri.parse("https://fakestoreapi.com/auth/login");
  void login(BuildContext context) async {
    isLoading = true;
    setState(() {});
    final info = {
      "username": emailController.text,
      "password": passwordController.text,
    };
    final encodedData = jsonEncode(info);
    final response = await http.post(
      url,
      body: encodedData,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final token = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (contex) => DummyForApiScreen()),
      );
      isLoading = false;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${response.body} status code is ${response.statusCode}",
          ),
        ),
      );
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xffFCFBFE),
      body: SafeArea(
        child: SizedBox(
          width: w,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: AlwaysScrollableScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome back to the app",
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
                        onTap: () {
                          selectedIndex = 0;
                          if (selectedIndex == 0) {
                            element[selectedIndex];
                          }
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: selectedIndex == 0
                                    ? Colors.deepPurple
                                    : Colors.black,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 4,
                              color: selectedIndex == 0
                                  ? Colors.deepPurple
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        splashColor: Colors.deepPurple,
                        onTap: () {
                          selectedIndex = 1;
                          if (selectedIndex == 1) {
                            element[selectedIndex];
                          }
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: selectedIndex == 1
                                    ? Colors.deepPurple
                                    : Colors.black,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 4,
                              color: selectedIndex == 1
                                  ? Colors.deepPurple
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    selectedIndex == 0 ? "Email Address" : "Phone Number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  // TextFormField,
                  selectedIndex == 0
                      ? CustomeEmail(controller: emailController)
                      : CutomePhone(controller: phoneController),
                  SizedBox(height: 5),
                  CutomeTextform(
                    controller: passwordController,
                    title: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  // Term & Condition and Privacy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Text(
                            "Keep me signed in",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Text("Forget Password", style: _textStyle()),
                    ],
                  ),
                  IgnorePointer(
                    ignoring: isLoading,
                    child: CButton(
                      title: isLoading ? 'Loading' : "Login",
                      onPressed: () {
                        login(context);
                      },
                    ),
                  ),
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
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "Sign up",
                            style: _textStyle(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
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
      ),
    );
  }
}
