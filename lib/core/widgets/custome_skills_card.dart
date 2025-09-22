import 'package:flutter/material.dart';
import 'package:music_app/core/widgets/InkMe.dart';

class CustomeSkillsCard extends StatelessWidget {
  const CustomeSkillsCard({super.key, required this.skill, required this.onTap});
  final String skill;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkMe(
      onTap: onTap,
      radius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(color: Colors.grey)
        ),
        child: Text(skill, textAlign: TextAlign.center,),
      ),
    );
  }
}
