import 'package:flutter/material.dart';

class RoutaionCircle extends StatelessWidget {
  const RoutaionCircle({
    super.key,
    required this.circleColor,
    required this.iconColor,
    required this.borderColor,
    required this.icon,
  });
  final Color circleColor;
  final Color iconColor;
  final Color borderColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
        border: Border.all(color: borderColor),
      ),

      child: Icon(icon, color: iconColor),
    );
  }
}
