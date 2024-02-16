import 'package:amazonmusiclone/modules/components/ovalBox.dart';
import 'package:amazonmusiclone/modules/podcasts/presentation/pages/trend_podcast/trending_podcast.dart';
import 'package:flutter/material.dart';

class PodcastHomepage extends StatefulWidget {
  const PodcastHomepage({super.key});

  @override
  State<PodcastHomepage> createState() => _PodcastHomepageState();
}

class _PodcastHomepageState extends State<PodcastHomepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text(
            " Explore Podcasts",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Trending Podcasts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: ovalbox(child: Text("SEE MORE")),
                        ),
                      ],
                    ),
                  ),
                  TrendingPodCasts(),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Find Podcasts in",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: ovalbox(
                            child: Text(
                          "Sports",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: ovalbox(
                            child: Text(
                          "News",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: ovalbox(
                            child: Text(
                          "Comedy",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: ovalbox(
                            child: Text(
                          "Music",
                          style: TextStyle(fontSize: 16),
                        )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
