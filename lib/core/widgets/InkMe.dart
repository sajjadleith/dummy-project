import 'package:flutter/material.dart';

class InkMe extends StatefulWidget {
  InkMe({
    super.key,
    required this.child,
    this.onTap,
    this.radius,
    this.overlayColor,
    this.padding,
  });

  final Widget child;
  final BorderRadius? radius;
  final Function()? onTap;
  final Color? overlayColor;
  final double? padding;

  @override
  State<InkMe> createState() => _InkMeState();
}

class _InkMeState extends State<InkMe> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this.widget.child,
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(this.widget.padding ?? 0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                this.widget.radius ?? BorderRadius.circular(50),
                splashColor: this.widget.overlayColor,
                onTap: this.widget.onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
