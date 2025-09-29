import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/login_screen.dart';
import '../core/widgets/custome_email.dart';
import '../core/widgets/cutome_button.dart';
import '../core/widgets/cutome_button_google.dart';
import '../core/widgets/cutome_divider.dart';
import '../core/widgets/cutome_phone.dart';
import '../core/widgets/cutome_textform.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  bool isActive = false;
  int selectedIndex = 0;
  late List<Widget> element = [
    CustomeEmail(controller: emailController),
    CutomePhone(controller: phoneController),
  ];
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                  CutomeTextform(
                    controller: confirmPasswordController,
                    title: "Confirm Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                    },
                  ),
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
                                TextSpan(
                                  text: "Condition",
                                  style: _textStyle(),
                                ),
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
                  CButton(
                    title: 'Sign up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("value of email: ${emailController.text}");
                        print("value of phone: ${phoneController.text}");
                        print("value of password: ${passwordController.text}");
                        print(
                          "value of password: ${confirmPasswordController.text}",
                        );
                      }
                    },
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
                            text: "Already have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "Sign in",
                            style: _textStyle(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
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
