import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/core/routes/app_routes.dart';
import 'package:music_app/core/routes/route_provider.dart';

class PageScreen3 extends StatefulWidget {
  PageScreen3({Key? key}) : super(key: key);

  @override
  _PageScreen3State createState() => _PageScreen3State();
}

class _PageScreen3State extends State<PageScreen3> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    double salary = args["salary"] ?? "0.0";
    String employeeName = args["employeeName"] ?? "Unknown";
    bool isAdmin = args["isAdmin"] ?? false;

    const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.transparent,
                    ),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          AppConstain.backArrow,
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Page3",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
            Padding(
              padding: padding,
              child: Text("Employee Name: $employeeName"),
            ),
            Padding(padding: padding, child: Text("Salary: $salary")),
            Padding(padding: padding, child: Text("is Admin: $isAdmin")),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.defaultRoute,
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
