import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MiniPlayer extends StatelessWidget {
  bool isPlaying;
  late Song song;
  MiniPlayer({super.key, required this.isPlaying, required this.song});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: isPlaying
          ? Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(song.photo), fit: BoxFit.cover)),
                )
              ],
            )
          : null,
    );
  }
}
