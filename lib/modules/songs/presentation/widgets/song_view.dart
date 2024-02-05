import 'package:amazonmusiclone/modules/player/pages/musicplayer.dart';
import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SongView extends StatelessWidget {
  Song song;
  List<Song> songlist;
  int index;
  SongView(
      {required this.song,
      required this.songlist,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => Music_Player(
                  song: song,
                  songs: songlist,
                  initialIndex: index,
                )));
      },
      child: ListTile(
        isThreeLine: true,
        minVerticalPadding: 10,
        horizontalTitleGap: 10,
        textColor: Colors.white,
        title: Text(song.trackName.substring(
            0, song.trackName.length > 20 ? 20 : song.trackName.length)),
        leading: Image.network(song.photo),
        subtitle: Text(
            "${song.trackName.substring(0, song.trackName.length > 20 ? 20 : song.trackName.length)} \n ${song.collection})"),
        trailing: const Icon(
          Icons.play_circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
