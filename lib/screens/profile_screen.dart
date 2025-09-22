import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/app-constain.dart';
import '../core/widgets/custome_card.dart';
import '../core/widgets/custome_skills_card.dart';
import '../core/widgets/info_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, Function()> skills = {
    "UI Designer" : () {},
    "UX Designer" : () {},
    "Design System fhfhfghfghfghfghfghfhgfghfghfghfghfhgfghfhgfghfghfghfghfghfghfghfghfhgfghfghfghfghf" : () {},
    "Product hgggyuguyguygyuuygyugyuguygygyu" : () {},
    "Successful" : () {},
  };

  @override
  Widget build(BuildContext context) {
   var sortedSkills = skills.entries.toList()..sort(((a, b) => a.key.compareTo(b.key)));
   skills = Map.fromEntries(sortedSkills);
  return Scaffold(
      backgroundColor: Color(0xffF0F0F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: AssetImage(AppConstain.appImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffF0F0F2),
                            radius: 50,
                            child: SvgPicture.asset(
                              AppConstain.home,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, right: 7),
                      child: Text(
                        "@Arnoldy",
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 7, right: 7),
                      child: Text(
                        "Arnoldy Chafe",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bandung ",
                          style: TextStyle(color: Color(0xff3565F2)),
                        ),
                        Text(
                          "| Joined Marc 2023",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomeCard(ico: AppConstain.profile, text: 'Follow'),
                        CustomeCard(ico: AppConstain.chat, text: 'Message'),
                        CustomeCard(ico: AppConstain.more, text: 'More'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                      ),
                      child: Text(
                        "CEO System D, Because your satisfaction is everything & Standing out from the rest, and that's what we want you to be as well.",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      "Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    InfoWidget(
                      ico: AppConstain.global,
                      title: 'Website',
                      desc: 'www.Arnoldy.com',
                    ),
                    InfoWidget(
                      ico: AppConstain.mail,
                      title: 'Email',
                      desc: 'Hello@adalahreza.com',
                    ),
                    InfoWidget(
                      ico: AppConstain.phone,
                      title: 'Phone',
                      desc: '+62 517 218 92 00',
                    ),
                    InfoWidget(
                      ico: AppConstain.cal,
                      title: 'Joined',
                      desc: '26 March, 2023',
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,

                      children: List.generate(
                        skills.keys.length,
                        (index) => CustomeSkillsCard(skill: skills.keys.elementAt(index), onTap: skills.values.elementAt(index),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
