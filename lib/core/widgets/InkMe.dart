import 'package:flutter/material.dart';

class InkMe extends StatefulWidget {
  const InkMe({
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
        widget.child,
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(widget.padding ?? 0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                widget.radius ?? BorderRadius.circular(50),
                splashColor: widget.overlayColor,
                onTap: widget.onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
