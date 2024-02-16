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
    /*
    The logic below is used to display random songs in trending section !Z
    */
    int randomIndex = Random().nextInt(Constants.keywords.length);
    String randomTrending = Constants.keywords[randomIndex];
    String url = Constants.getTrend(randomTrending);

    Response response = await _getIt<ApiClient>().get(url);

    dynamic object = jsonDecode(response.data);

    List<dynamic> list = object["results"];
    List<Song> song = list.map((e) => Song.SongFROMJSON(e)).toList();
    return song;
  }
}
