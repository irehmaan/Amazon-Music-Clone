import 'package:amazonmusiclone/modules/home/presentation/widgets/top_songs.dart';

import 'package:amazonmusiclone/modules/podcasts/presentation/pages/podcast_homepage/podcast_home.dart';

import 'package:amazonmusiclone/modules/singer/domain/repo/singer_service.dart';
import 'package:amazonmusiclone/modules/trending/presentation/pages/trendingsongs.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../components/ovalBox.dart';
import '../../../singer/presentation/pages/singer_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GetIt _getIt = GetIt.instance;

  _goToPodcats() {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const PodcastHomepage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              )),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 35,
              width: 100,
              child: ovalbox(
                child: Text(
                  "MUSIC",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 35,
              width: 100,
              child: ovalbox(
                onTap: _goToPodcats,
                child: const Text(
                  "PODCAST",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            )
          ]),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: Text(
                        "Trending Artists",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                      width: 95,
                      child: ovalbox(
                        child: Text(
                          "SEE MORE",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingerView(singer: _getIt<SingerService>().getSingers),
                Divider(
                  color: Colors.grey.withOpacity(0.24),
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 280,
                      width: MediaQuery.of(context).size.width * 0.94,
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: TrendingSongView()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.01,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 6),
                    child: TopSong(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
