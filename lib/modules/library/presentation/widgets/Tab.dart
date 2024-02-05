import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  final int lenght;
  final String tab1;
  final String tab2;
  final String tab3;
  const Tabs(
      {super.key,
      required this.lenght,
      required this.tab1,
      required this.tab2,
      required this.tab3});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: lenght,
        initialIndex: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      tab1,
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      tab2,
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      tab3,
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
            ),
          ],
        ));
  }
}
