import 'package:flutter/material.dart';
import 'package:music_app/core/widgets/sperated-list.dart';
import 'package:music_app/screens/music_screen.dart';
import '../core/app-constain.dart';
import '../core/widgets/custom-card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onTap() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MusicScreen()));
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(AppConstain.thumbnail, fit: BoxFit.cover),
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
              top: 150,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height + 100,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.sizeOf(context).height - 220,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 20,
                            bottom: 5,
                          ),
                          child: Text(
                            "Aktivias Terakhir",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SperatedList(),
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
                          onTap: () => onTap,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomCart(
                          title: 'Stress bukan segaadfdfdf',
                          desc: '4 Menit . Sedang',
                          img: '${AppConstain.imgs[1]}',
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
