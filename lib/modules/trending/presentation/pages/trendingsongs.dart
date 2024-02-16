// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';

import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';

import 'package:amazonmusiclone/modules/trending/domain/repo/trend_service.dart';

import 'package:amazonmusiclone/settings/constants/config.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class TrendingSongView extends StatelessWidget {
  // String Trending;

  TrendingSongView({
    super.key,
  });

  final TrenSongService _trenSongService = TrenSongService.getInstance();
  final GetIt _getIt = GetIt.instance;
  int randomIndex = Random().nextInt(Constants.keywords.length);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _trenSongService.getTrendingSongs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went wrong !!"),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        return Consumer<Player>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
              padding: const EdgeInsets.all(6),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                List<Song> songlist = snapshot.data;
                Song song = songlist[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  leading: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("${index + 1}"),
                      ),
                      Image.network(song.photo),
                    ],
                  ),
                  title: Text(song.trackName),
                  subtitle: Text(song.collection.substring(
                    0,
                    song.collection.length > 30 ? 20 : song.collection.length,
                  )),
                  trailing: const Icon(Icons.play_circle),
                  onTap: () {
                    ValueNotifier<bool> hideMiniPlayer =
                        _getIt.get<ValueNotifier<bool>>(
                            instanceName: 'hideMiniPlayer');
                    hideMiniPlayer.value = true;
                    final ValueNotifier<bool> _extendedPlayer =
                        _getIt.get<ValueNotifier<bool>>(
                            instanceName: 'extendedPlayer');
                    _extendedPlayer.value = true;
                    context.read<Player>().setPlaylist(snapshot.data);
                    context.read<Player>().currentIndex = index;
                    final playlist = context.read<Player>().playlist;
                    context.read<Player>().playAudio(playlist[index].songurl);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
