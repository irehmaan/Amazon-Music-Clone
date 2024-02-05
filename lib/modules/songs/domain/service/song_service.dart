import 'dart:convert';

import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';


import '../model/song_model.dart';

class SongService {
  static SongService songService = SongService._();
  SongService._();

  static SongService getInstance() {
    return songService;
  }

  Future<List<Song>> getSongs(String singerName) async {
    final url = Constants.getURL(singerName);
    // _getIt<ApiClient>().get(url);

    Response response = await ApiClient().get(url);
    dynamic object = jsonDecode(response.data);
    List<dynamic> list = object["results"];
    // print("object is \n");
    // print(list);
    List<Song> songs = list.map((e) => Song.SongFROMJSON(e)).toList();
    return songs;
  }
}
