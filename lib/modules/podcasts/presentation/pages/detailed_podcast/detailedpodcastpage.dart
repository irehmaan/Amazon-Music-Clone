import 'package:amazonmusiclone/modules/components/ovalBox.dart';
import 'package:amazonmusiclone/modules/podcasts/presentation/widgets/podcast_listview/pod_listbuilder.dart';
import 'package:amazonmusiclone/modules/podcasts/presentation/widgets/start_here_widget/start_here.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

class DetailedPodPage extends StatelessWidget {
  final RssFeed rssFeed;
  const DetailedPodPage({super.key, required this.rssFeed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        rssFeed.image?.url ?? '',
                        height: 240,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Text(
                            rssFeed.image!.title!,
                            style: const TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            rssFeed.itunes!.author!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "PODCAST",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: ovalbox(
                            Color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                  color: Colors.grey.shade400,
                                ),
                                Text(
                                  "Follow",
                                  style: TextStyle(color: Colors.grey.shade400),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.info, size: 30),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.share,
                        size: 30,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                    child: Row(
                      children: [
                        Text(
                          "Start Here",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: PodListBuilder(
                        episodes: rssFeed.items!.sublist(0), rssFeed: rssFeed),
                  ),
                  StartHere(
                    rssFeed: rssFeed,
                  ),
                  PodListBuilder(
                    episodes: rssFeed.items!.sublist(1),
                    rssFeed: rssFeed,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
