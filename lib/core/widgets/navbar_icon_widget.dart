import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarIconWidget extends StatelessWidget {
  const NavbarIconWidget({super.key, required this.ico, required this.color});
  final String ico;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: color, width: 4),
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: SvgPicture.asset(ico, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),),
    );
  }
}
