// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:amazonmusiclone/modules/components/container.dart';

import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';

import 'package:amazonmusiclone/modules/trending/domain/repo/trend_service.dart';

import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:flutter/material.dart';

class TrendingSongView extends StatelessWidget {
  // String Trending;

  TrendingSongView({
    super.key,
  });

  final TrenSongService _trenSongService = TrenSongService.getInstance();

  int randomIndex = Random().nextInt(Constants.keywords.length);

  @override
  Widget build(BuildContext context) {
    // print(randomIndex);
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
        }

        return ListView.builder(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            Song trendingSong = snapshot.data[index];
            List<Song> songlist = snapshot.data;

            // AsyncSnapshot snapshotdata = snapshot;
            return MyContainer(
              song: trendingSong,
              songlist: songlist,
              index: index,
            );
          },
        );
      },
    );
  }
}
