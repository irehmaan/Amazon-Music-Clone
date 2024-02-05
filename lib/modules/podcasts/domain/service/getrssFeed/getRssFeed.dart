import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:webfeed_revised/domain/rss_feed.dart';
import 'package:webfeed_revised/webfeed_revised.dart';

class FetchRssFeed {
  final GetIt _it = GetIt.instance;
  static final FetchRssFeed _fetchRssFeed = FetchRssFeed._();
  FetchRssFeed._();

  static FetchRssFeed getInstance() {
    return _fetchRssFeed;
  }

  Future<RssFeed> getFeed(String url) async {
    Response response = await _it<ApiClient>().get(url);
    RssFeed rssFeed = RssFeed.parse(response.data);

    return rssFeed;
  }
}
