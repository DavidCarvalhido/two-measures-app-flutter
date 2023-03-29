import 'package:flutter/material.dart';
import 'dart:ui';

class TopBarGlass extends StatefulWidget {
  final Color? color;
  final double? height;
  final double? blurStrengthX;
  final double? blurStrengthY;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  TopBarGlass({
    this.color,
    this.height,
    this.blurStrengthX,
    this.blurStrengthY,
    this.title,
    this.leading,
    this.actions,
  });

  @override
  _TopBarGlassState createState() => _TopBarGlassState();
}

class _TopBarGlassState extends State<TopBarGlass> {
  @override
  Widget build(BuildContext context) {
    var scrSize = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blurStrengthX ?? 10,
            sigmaY: widget.blurStrengthY ?? 10,
          ),
          child: Container(
            color: Colors.green.withAlpha(60),
            alignment: Alignment.center,
            width: scrSize.width,
            height: widget.height ?? 85,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  color: Colors.transparent,
                  child: widget.leading,
                ),
                Expanded(
                  child: widget.title ?? Container(),
                ),
                Row(
                  children: widget.actions ?? [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
