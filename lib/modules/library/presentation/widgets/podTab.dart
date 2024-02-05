import 'package:flutter/material.dart';

class PodTab extends StatelessWidget {
  final int lenght;
  final String tab1;
  final String tab2;
  final String tab3;
  final String tab4;
  const PodTab(
      {super.key,
      required this.lenght,
      required this.tab1,
      required this.tab2,
      required this.tab3,
      required this.tab4});

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
                child: Center(
                    child: Text(
                  tab1,
                  style: const TextStyle(fontSize: 15),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                    child: Text(
                  tab2,
                  style: const TextStyle(fontSize: 15),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                    child: Text(
                  tab3,
                  style: const TextStyle(fontSize: 15),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                    child: Text(
                  tab4,
                  style: const TextStyle(fontSize: 14),
                )),
              ),
            ),
          ],
        ));
  }
}
