import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';
import 'package:amazonmusiclone/modules/podplayer/presentation/pages/podplayer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';
import 'package:webfeed_revised/domain/rss_item.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

class PodcastList extends StatelessWidget {
  final RssItem? episode;
  final RssFeed? rssFeed;
  PodcastList({super.key, required this.episode, required this.rssFeed});

  checkText() {
    if (episode!.pubDate != null) {
      return episode!.pubDate.toString().substring(
          0,
          episode!.pubDate.toString().length > 10
              ? 10
              : episode!.pubDate.toString().length);
    } else {
      return "N/A";
    }
  }

  final GetIt _getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    // DateFormat dateFormat = DateFormat('dd-MMM-yy');

    String formatDuration(Duration duration) {
      int hours = duration.inHours;
      int mins = duration.inMinutes.remainder(60);
      return '$hours hr $mins mins';
    }

    return Consumer<Player>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey.withOpacity(0.24),
                    thickness: 1.5,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: SizedBox(
                            height: 76,
                            width: 75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(rssFeed!.image!.url!),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  checkText(),
                                  style: TextStyle(color: Colors.cyan.shade400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  episode!.title!,
                                  style: const TextStyle(fontSize: 12),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    ValueNotifier<bool> hideMiniPlayer =
                                        _getIt.get<ValueNotifier<bool>>(
                                            instanceName: 'hideMiniPlayer');
                                    hideMiniPlayer.value = false;
                                    context
                                        .read<Player>()
                                        .playAudio(episode!.enclosure!.url!);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => PodPlayer(
                                                episode: episode,
                                                rssFeed: rssFeed)));
                                  },
                                  icon: const Icon(
                                    Icons.play_circle_outline_outlined,
                                    size: 35,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                formatDuration(episode!.itunes!.duration!),
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.file_download_outlined,
                                    size: 28,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    size: 28,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
