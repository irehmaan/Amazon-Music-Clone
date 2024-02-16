import 'package:amazonmusiclone/modules/podcasts/domain/model/podcastmodel/podcastmodel.dart';

import 'package:amazonmusiclone/modules/podcasts/domain/service/getpodcast/getpodcast.dart';
import 'package:amazonmusiclone/modules/podcasts/presentation/widgets/fetch_pod_widget/FetcgPodcast.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrendingPodCasts extends StatelessWidget {
  TrendingPodCasts({super.key});

  List<Podcast> podcastlist = [];

  final FetchPodcastService _podcastService = FetchPodcastService.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _podcastService.getPoddcast(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong.."),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              Podcast podcast = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FetchPodcast(feedUrl: podcast.feedUrl)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Image.network(podcast.photo)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
