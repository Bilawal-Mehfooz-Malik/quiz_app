import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final VoidCallback onPressed;
  const CustomIconButton({
    super.key,
    this.bottom,
    this.left,
    this.right,
    this.top,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: IconButton(
        iconSize: 40,
        color: Colors.white,
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
