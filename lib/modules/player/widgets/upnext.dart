import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpNext extends StatelessWidget {
  int index;
  List<Song>? songs;
  final Function()? onTap;
  UpNext({super.key, required this.index, required this.songs, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        contentPadding: const EdgeInsets.all(2),
        isThreeLine: true,
        hoverColor: Colors.grey.shade300,
        horizontalTitleGap: 10,
        textColor: Colors.white,
        title: Text(songs![index].trackName.substring(
            0,
            songs![index].trackName.length > 20
                ? 20
                : songs![index].trackName.length)),
        leading: Image.network(songs![index].photo),
        // trailing:
        //  const Icon(
        //   Icons.play_circle,
        //   color: Colors.white,
        // ),
        subtitle: Text(
          songs![index].collection.substring(
              0,
              songs![index].collection.length > 20
                  ? 20
                  : songs![index].collection.length),
        ),
      ),
    );
  }
}
