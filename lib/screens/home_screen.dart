import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          // Image
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.asset(
              "assests/images/thumbnail9.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Text on the image
          Container(
            padding: EdgeInsets.only(top: 80, left: 20),
            child: Text(
              "Selamat Pagi, Julio",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.only(left: 20, top: 30, bottom: 5),
                        child: Text(
                          "Aktivias Terakhir",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        // color: Colors.blue,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10);
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assests/images/thumbnail9.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text(
                                    "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext$index",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
