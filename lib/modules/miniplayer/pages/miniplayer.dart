import 'package:amazonmusiclone/settings/themes/light_theme.dart';
import 'package:amazonmusiclone/settings/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../player/audioPlayer Service/audioPlayer.dart';

// ignore: must_be_immutable
class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Player>(
      builder: (BuildContext context, Player value, Widget? child) {
        final int? currIndex = value.currentIndex;
        return Container(
            decoration: BoxDecoration(
                color: context.read<ThemeProvider>().themeData == lighTheme
                    ? Colors.grey.shade700
                    : Colors.black,
                borderRadius: BorderRadius.circular(2)),
            child: Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: value.currentIndex == null
                    ? const Text("Nothing")
                    : Image.network(value.playlist[currIndex!].photo),
                title: value.currentIndex == null
                    ? const Text("Nothing is playing")
                    : Text(value.playlist[currIndex!].trackName),
                trailing: IconButton(
                    onPressed: () {
                      if (value.isPlaying) {
                        value.pauseAudio();
                      } else {
                        value.playAudio(value.playlist[currIndex!].songurl);
                      }
                    },
                    icon: value.isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow)),
              ),
            ));
      },
    );
  }
}
