import 'package:flutter/material.dart';

class AlexPage extends StatelessWidget {
  const AlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Coming Soon")],
          ),
        ),
      ),
    );
  }
}
