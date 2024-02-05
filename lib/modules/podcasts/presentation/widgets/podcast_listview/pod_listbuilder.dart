import 'package:amazonmusiclone/modules/podcasts/presentation/widgets/pod_listview_widget/podlist.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_revised/webfeed_revised.dart';

class PodListBuilder extends StatelessWidget {
  final List<RssItem> episodes;
  final RssFeed rssFeed;
  const PodListBuilder(
      {super.key, required this.episodes, required this.rssFeed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemCount: episodes.length,
      // itemCount: widget.episodes.length,
      itemBuilder: (context, index) {
        RssItem episode = episodes[index];
        return PodcastList(
          episode: episode,
          rssFeed: rssFeed,
        );
      },
    );
  }
}
