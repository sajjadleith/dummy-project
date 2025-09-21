import 'dart:async';

import 'package:flutter/material.dart';
import '../core/app-constain.dart';
import '../core/widgets/custom-card.dart';
import 'package:flutter_svg/svg.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double currentValue = 0.0;
  final double maxValue = 300;

  String formatTime(int second) {
    final minutes = (second ~/ 60).toString();
    final secs = (second % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
  Timer? _timer;

  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentValue < maxValue) {
        setState(() {
          currentValue += 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void startTimer() {
    _timer?.cancel(); // نوقف أي تايمر موجود
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentValue < maxValue) {
        setState(() {
          currentValue += 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      currentValue = 0;
    });
  }



  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            // Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pinkAccent, Colors.lightBlueAccent],
                ),
              ),
            ),
            // Text on the image
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: SvgPicture.asset(
                  AppConstain.backArrow,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 20, top: 30, bottom: 5),
                            child: Text(
                              "Daily Meditation",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 30)),

                      SliverToBoxAdapter(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AppConstain.env4),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                            child: Text(
                              "River Sound",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 30)),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 50),
                              child: Material(
                                shape: CircleBorder(
                                  side: BorderSide(color: Colors.black),
                                ),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    resetTimer();
                                  },
                                  customBorder: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(17),
                                    child: SvgPicture.asset(
                                      AppConstain.replay,
                                      height: 18,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              shape: CircleBorder(),
                              color: Colors.purple[900],
                              child: InkWell(
                                onTap: () {
                                  startTimer();
                                },
                                customBorder: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.all(17),
                                  child: SvgPicture.asset(
                                    AppConstain.play,
                                    height: 40,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 50),
                              child: Material(
                                shape: CircleBorder(
                                  side: BorderSide(color: Colors.black),
                                ),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {},
                                  customBorder: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(17),
                                    child: SvgPicture.asset(
                                      AppConstain.love,
                                      height: 18,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 30)),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Slider(
                              value: currentValue,
                              min: 0,
                              max: maxValue,
                              activeColor: Colors.purple[900],
                              inactiveColor: Colors.grey,
                              onChanged: (value) {
                                currentValue = value;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(formatTime(currentValue.toInt())),
                                  Text(formatTime(300)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rekomendasi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Lihat Lebih",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: CustomCart(
                          title: 'Meditasi Dasar 2',
                          desc: '2 Menit . Singkart',
                          img: '${AppConstain.imgs[0]}',
                          onTap: () {},
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomCart(
                          title: 'Meditasi Dasar 2',
                          desc: '2 Menit . Singkart',
                          img: '${AppConstain.imgs[0]}',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
