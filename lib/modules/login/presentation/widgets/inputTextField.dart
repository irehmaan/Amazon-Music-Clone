import 'package:flutter/material.dart';

class inputTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const inputTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade900),
                borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.black,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey.shade100, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
