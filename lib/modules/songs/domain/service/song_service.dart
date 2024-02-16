import 'dart:convert';

import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/song_model.dart';

class SongService {
  static SongService songService = SongService._();
  SongService._();

  static SongService getInstance() {
    return songService;
  }

  Future<List<Song>> getSongs(String singerName) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final GetIt _getIt = GetIt.instance;
    final url = Constants.getURL(singerName);

    Response response = await _getIt<ApiClient>().get(url);
    dynamic object = jsonDecode(response.data);
    List<dynamic> list = object["results"];
    // print("object is \n");
    // print(list);
    List<Song> songs = list.map((e) => Song.SongFROMJSON(e)).toList();
    return songs;
  }
}
