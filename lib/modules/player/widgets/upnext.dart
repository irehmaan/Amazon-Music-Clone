import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UpNext extends StatelessWidget {
  UpNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Player>(
      builder: (context, player, child) {
        final playlist = player.playlist;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0),

              hoverColor: Colors.grey.shade300,
              horizontalTitleGap: 10,

              title: Text(playlist[index].trackName.substring(
                  0,
                  playlist[index].trackName.length > 20
                      ? 20
                      : playlist[index].trackName.length)),
              leading: Image.network(playlist[index].photo),
              // trailing:
              //  const Icon(
              //   Icons.play_circle,
              //   color: Colors.white,
              // ),
              subtitle: Text(
                playlist[index].collection.substring(
                    0,
                    playlist[index].collection.length > 20
                        ? 20
                        : playlist[index].collection.length),
              ),
            );
          },
        );
      },
    );
  }
}
