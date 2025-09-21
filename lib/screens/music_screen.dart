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
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 30, bottom: 5),
                        child: Text(
                          "Daily Meditation",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Container(
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

                      Container(
                        padding: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                        child: Text(
                          "River Sound",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      Row(
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
                                onTap: () {},
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
                              onTap: () {},
                              customBorder: CircleBorder(),
                              child: Padding(
                                padding: EdgeInsets.all(17),
                                child: SvgPicture.asset(
                                  AppConstain.play,
                                  height: 15,
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
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Slider(
                            value: 2.24,
                            min: 0,
                            max: 3.00,
                            activeColor: Colors.purple[900],
                            inactiveColor: Colors.grey,
                            onChanged: (value) {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2:24"),
                                Text("3:00"),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Padding(
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

                      CustomCart(
                        title: 'Meditasi Dasar 2',
                        desc: '2 Menit . Singkart',
                        img: '${AppConstain.imgs[0]}',
                        onTap: () {},
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
