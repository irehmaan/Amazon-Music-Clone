import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    super.key,
  });

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0),
          child: TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(0),
                  constraints: BoxConstraints(
                      maxHeight: 45,
                      maxWidth: MediaQuery.of(context).size.width / 1.2),
                  hintText: "Search music and podcasts",
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(40)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                  )),
              controller: _controller,
              obscureText: false),
        ),
      ],
    );
  }
}
