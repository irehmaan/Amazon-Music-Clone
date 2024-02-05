import 'package:flutter/material.dart';

class ovalbox extends StatelessWidget {
  final child;
  final Color;
  final Function()? onTap;
  const ovalbox(
      {super.key, required this.child, required this.Color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color,
              border: Border.all(color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
