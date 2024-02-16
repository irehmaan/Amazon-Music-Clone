import 'package:amazonmusiclone/modules/podcasts/domain/service/getrssFeed/getRssFeed.dart';

import 'package:amazonmusiclone/modules/podcasts/presentation/pages/detailed_podcast/detailedpodcastpage.dart';
import 'package:flutter/material.dart';

import 'package:webfeed_revised/webfeed_revised.dart';

class FetchPodcast extends StatelessWidget {
  final String feedUrl;
  FetchPodcast({super.key, required this.feedUrl});

  final FetchRssFeed _fetchRssFeed = FetchRssFeed.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RssFeed>(
      future: _fetchRssFeed.getFeed(feedUrl),
      builder: (context, AsyncSnapshot<RssFeed> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong..."),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final RssFeed? rssFeed = snapshot.data;

          return DetailedPodPage(
            rssFeed: rssFeed!,
          );
        }
      },
    );
  }
}
