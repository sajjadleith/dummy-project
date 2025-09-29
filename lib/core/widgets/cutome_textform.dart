import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app-constain.dart';

class CutomeTextform extends StatefulWidget {
  const CutomeTextform({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
  });
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CutomeTextform> createState() => _CutomeTextformState();
}

class _CutomeTextformState extends State<CutomeTextform> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          widget.title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 2),
                      child: SvgPicture.asset(
                        AppConstain.lock,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text("|", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                hintText: widget.title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Material(
                  shape: CircleBorder(),
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 25,
                        child: SvgPicture.asset(
                          obscureText ? AppConstain.dontShow : AppConstain.show,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              obscureText: obscureText,
              validator: widget.validator,
            ),
          ),
        ),
      ],
    );
  }
}
