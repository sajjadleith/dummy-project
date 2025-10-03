import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/app-constain.dart';
import 'package:music_app/core/routes/app_routes.dart';
import 'package:music_app/core/widgets/custome_textfiel.dart';

class PageScreen2 extends StatefulWidget {
  PageScreen2({Key? key}) : super(key: key);

  @override
  _PageScreen2State createState() => _PageScreen2State();
}

class _PageScreen2State extends State<PageScreen2> {
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController employeeController = TextEditingController();
  bool isAdmin = false;

  Map<String, dynamic> get data => {
    "salary": double.parse(salaryController.text),
    "employeeName": employeeController.text,
    "isAdmin": isAdmin,
  };

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String name = args["name"] ?? "Unkown";
    int age = args["age"] ?? 0;
    String gender = args["gender"] ?? "Unkown";

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
                    "Page2",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
            Padding(padding: padding, child: Text("Name: $name")),
            Padding(padding: padding, child: Text("Age: $age")),
            Padding(padding: padding, child: Text("Gender: $gender")),
            CustomeTextfield(
              controller: salaryController,
              title: 'Enter The salary',
            ),
            CustomeTextfield(
              controller: employeeController,
              title: 'Enter The employee name',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isAdmin,
                  onChanged: (bool? isAdmin) {
                    if (isAdmin == null) {
                      return;
                    }
                    this.isAdmin = isAdmin;
                    setState(() {});
                  },
                ),
                SizedBox(width: 10),
                Text("is Admin?"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.thirdRoute,
                  arguments: data,
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
