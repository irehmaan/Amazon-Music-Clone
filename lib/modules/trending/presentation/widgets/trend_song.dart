import 'package:amazonmusiclone/modules/trending/domain/model/trending_song.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopSongBox extends StatelessWidget {
  TrendingSong trendingSong;
  TopSongBox({super.key, required this.trendingSong});

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      leading: Image.network(
        trendingSong.photo,
        height: 40,
      ),
      title: Text(trendingSong.collection),
      // subtitle: Text(),
    );
  }
}
