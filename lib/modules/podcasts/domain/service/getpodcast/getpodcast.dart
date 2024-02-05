import 'dart:convert';

import 'package:amazonmusiclone/modules/podcasts/domain/model/podcastmodel/podcastmodel.dart';

import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class FetchPodcastService {
  final GetIt _getIt = GetIt.instance;

  static final FetchPodcastService _podcastService = FetchPodcastService._();
  FetchPodcastService._();

  static FetchPodcastService getInstance() {
    return _podcastService;
  }

  Future<List<Podcast>> getPoddcast() async {
    final url = Constants.getPodcasts();
    _getIt<ApiClient>().get(url);

    Response response = await _getIt<ApiClient>().get(url);
    dynamic obj = jsonDecode(response.data);
    List<dynamic> list = obj["results"];
    // print("Podcast Data:");
    // print(list);
    List<Podcast> podcast =
        list.map((e) => Podcast.PodcastModelFromJson(e)).toList();
    // print(podcast);
    return podcast;
  }
}
