import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app-constain.dart';

class CutomePhone extends StatefulWidget {
  const CutomePhone({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<CutomePhone> createState() => _CutomePhoneState();
}

class _CutomePhoneState extends State<CutomePhone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    AppConstain.phone,
                    width: 20,
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                Text("|", style: TextStyle(color: Colors.grey)),
              ],
            ),
            hintText: "Enter Your Phone Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Phone number is required";
            }
            if (value.length < 11) {
              return "Phone number must be at least 11 digits";
            }
            return null;
          },
        ),
      ),
    );
  }
}
