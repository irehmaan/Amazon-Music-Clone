import 'package:amazonmusiclone/modules/home/presentation/widgets/top_songs.dart';

import 'package:amazonmusiclone/modules/podcasts/presentation/pages/home/podcast_home.dart';

import 'package:amazonmusiclone/modules/singer/domain/repo/singer_service.dart';
import 'package:amazonmusiclone/modules/trending/presentation/pages/trendingsongs.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../components/ovalBox.dart';
import '../../../singer/presentation/widgets/singer_view.dart';

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
          backgroundColor: Colors.black.withOpacity(0.54),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 35,
              width: 100,
              child: ovalbox(
                Color: Colors.black.withOpacity(0.47),
                child: const Text(
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
                Color: Colors.black.withOpacity(0.47),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending Playlists",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 29,
                      width: 95,
                      child: ovalbox(
                        Color: Colors.grey.shade900,
                        child: const Text(
                          "SEE MORE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
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
                      style: TextStyle(fontSize: 25, color: Colors.white),
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: TrendingSongView()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.18,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TopSong(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
