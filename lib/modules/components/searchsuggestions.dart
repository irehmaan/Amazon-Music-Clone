import 'package:amazonmusiclone/modules/components/ovalBox.dart';
import 'package:amazonmusiclone/modules/songs/presentation/pages/song_page.dart';
import 'package:flutter/material.dart';

class SuggestionsBox extends StatelessWidget {
  final String suggestionBoxName;
  final List<String> suggestions;
  final List<List<Color>> colors;
  const SuggestionsBox(
      {super.key,
      required this.suggestionBoxName,
      required this.suggestions,
      required this.colors});

  Widget buildSugesstionBox(
      List<Color> colors, String title, BuildContext context, name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => Songs(singerName: name)));
      },
      child: SizedBox(
        height: 100,
        width: 180,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.clamp,
                    colors: colors),
                border: Border.all(color: Colors.grey.shade900),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                suggestionBoxName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 35,
                width: 100,
                child: ovalbox(
                  Color: Colors.black.withOpacity(0.47),
                  child: const Text(
                    "See More",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSugesstionBox(
                colors[0], suggestions[0], context, suggestions[0]),
            buildSugesstionBox(
                colors[1], suggestions[1], context, suggestions[1])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSugesstionBox(
                colors[2], suggestions[2], context, suggestions[2]),
            buildSugesstionBox(
                colors[3], suggestions[3], context, suggestions[3])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSugesstionBox(
                colors[4], suggestions[4], context, suggestions[4]),
            buildSugesstionBox(
                colors[5], suggestions[5], context, suggestions[5])
          ],
        )
      ],
    );
  }
}
