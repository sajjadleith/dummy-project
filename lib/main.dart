import 'package:flutter/material.dart';
import 'package:music_app/screens/chat_screen.dart';
import 'package:music_app/screens/dummy_screen.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/onbording_screen.dart';
import 'package:music_app/screens/register_screen.dart';
import 'package:music_app/screens/profile_screen.dart';
import 'core/widgets/custom_navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<Widget> screens = [
    HomeScreen(),
    DummyScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  onChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        fontFamily: "Tajawal",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: Scaffold(
      //   backgroundColor: Colors.grey[100],
      //   body: screens[currentIndex],
      //   bottomNavigationBar: CustomNavbar(
      //     currentIndex: currentIndex,
      //     onChange: onChange,
      //   ),
      // ),
      // home: RegisterScreen(),
      home: OnbordingScreen(),
    );
  }
}
