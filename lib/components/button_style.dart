import 'package:flutter/material.dart';

class ButtonListStyle extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final Size? fontSize;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final double? size;

  ButtonListStyle(
      {Key? key,
      this.textColor,
      this.backgroundColor,
      this.fontSize,
      required this.label,
      required this.icon,
      required this.onPressed,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      icon: Icon(
        Icons.arrow_forward_ios,
        size: 32,
        color: Colors.white, // this way change the icon color
      ),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
