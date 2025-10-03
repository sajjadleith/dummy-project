import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/models/gros_model.dart';
import 'package:music_app/screens/login_screen.dart';

class OnbordingScreen extends StatefulWidget {
  OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();

  List<GrosModel> data = [
    GrosModel(
      image: AppConstain.onbording1,
      title: "Discover App Ninja",
      desc:
          "Ninja is a fast 24/7 delivery app for food and groceries in Saudi Arabia.",
    ),
    GrosModel(
      image: AppConstain.onbording2,
      title: "Fast Delivery, Anytime",
      desc:
          "Get groceries, meals, and essentials delivered to your door-24/7, in under 30 minutes",
    ),
    GrosModel(
      image: AppConstain.onbording3,
      title: "All You Need, One app",
      desc:
          "From fresh food to daily must-have Ninja brings everything to you-quickly and reliably",
    ),
  ];

  int _currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(width: width, height: height),
              Container(
                width: width,
                height: 600,
                child: SvgPicture.asset(
                  data[_currentPage.clamp(0, data.length - 1)].image,
                ),
              ),
              Positioned(
                top: 450,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width,
                        height: 250,
                        color: Colors.white,
                        child: PageView.builder(
                          itemCount: data.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            _currentPage = index;
                            setState(() {});
                            if (index == data.length - 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    data[index].title,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    data[index].desc,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(data.length, (index) {
                          return AnimatedContainer(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            duration: Duration(milliseconds: 300),
                            width: _currentPage == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.deepPurple
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      if (_currentPage == data.length - 1)
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(400, 50),
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Get Started"),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
