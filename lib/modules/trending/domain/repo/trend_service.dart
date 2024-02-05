import 'dart:convert';
import 'dart:math';

import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class TrenSongService {
  final GetIt _getIt = GetIt.instance;

  static TrenSongService trenSongService = TrenSongService._();
  TrenSongService._();

  static TrenSongService getInstance() {
    return trenSongService;
  }

  Future<List<Song>> getTrendingSongs() async {
    int randomIndex = Random().nextInt(Constants.keywords.length);
    String randomTrending = Constants.keywords[randomIndex];
    String url = Constants.getTrend(randomTrending);
    _getIt<ApiClient>().get(url);
    Response response = await ApiClient().get(url);
    dynamic object = jsonDecode(response.data);

    List<dynamic> list = object["results"];
    // print("object is \n");
    // print(list);
    List<Song> song = list.map((e) => Song.SongFROMJSON(e)).toList();
    // print(song);
    return song;
  }
}
