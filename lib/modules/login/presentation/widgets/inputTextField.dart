import 'package:flutter/material.dart';

class inputTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final bool showEye;
  const inputTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.showEye});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 330,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade900),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: Colors.black,
                      filled: true,
                      hintText: hintText,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade100.withOpacity(0.3),
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: showEye
                    ? const Icon(Icons.visibility, color: Colors.white)
                    : null,
              )
            ],
          ),
        ],
      ),
    );
  }
}
