import 'package:amazonmusiclone/settings/constants/config.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/singermodel.dart';

class SingerService {
  final GetIt _getIt = GetIt.instance;
  //final ApiClient _apiClient = ApiClient();

  Future<List<Singer>> getSingers() async {
    String url = Constants.Singers_URL;
    _getIt<ApiClient>().get(url);

    Response response = await ApiClient().get(url);
    List<dynamic> list = response.data["singers"];
    List<Singer> singer = list.map((e) => Singer.SingerFromJson(e)).toList();

    return singer;
  }
}
