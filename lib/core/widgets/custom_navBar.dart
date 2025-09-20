import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/screens/dummy_screen.dart';
import 'package:music_app/screens/home_screen.dart';

import 'navbar_icon_widget.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.onChange,
    required this.currentIndex,
  });
  final Function(int) onChange;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onChange(0),
            child: NavbarIconWidget(ico: AppConstain.home, color: currentIndex == 0 ? Color(0xff5203fc) : Colors.white60,),
          ),
          GestureDetector(
            onTap: () => onChange(1),
            child: NavbarIconWidget(ico: AppConstain.cal, color: currentIndex == 1 ? Color(0xff5203fc) : Colors.white60),
          ),
          GestureDetector(
            onTap: () {},
            child: NavbarIconWidget(ico: AppConstain.chat, color: currentIndex == 2 ? Color(0xff5203fc) : Colors.white60),
          ),
          GestureDetector(
            onTap: () {},
            child: NavbarIconWidget(ico: AppConstain.profile, color: currentIndex == 3 ? Color(0xff5203fc) : Colors.white60),
          ),
        ],
      ),
    );
  }
}
