import 'package:amazonmusiclone/modules/player/audioPlayer/audioPlayer.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';
import 'package:webfeed_revised/domain/rss_item.dart';

class PodPlayer extends StatefulWidget {
  final RssItem? episode;
  final RssFeed? rssFeed;
  PodPlayer({super.key, required this.episode, required this.rssFeed});

  @override
  State<PodPlayer> createState() => _PodPlayerState();
}

class _PodPlayerState extends State<PodPlayer> {
  @override
  void initState() {
    context.read<Player>().playAudio(widget.episode!.enclosure!.url ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = Provider.of<Player>(context).isPlaying;
    return Scaffold(
      body: SafeArea(
        child: Consumer<Player>(
          builder: (BuildContext context, Player value, Widget? child) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_drop_down_sharp)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 355,
                      width: 355,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.network(widget.rssFeed!.image!.url!)),
                    ),
                    // Positioned(
                    //   width: 398,
                    //   top: 324,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Consumer<Player>(
                    //         builder:
                    //             (BuildContext context, data, Widget? child) {
                    //           return Slider(
                    //             activeColor: Colors.white,
                    //             inactiveColor: Colors.grey,
                    //             value: (data.songPosition != null &&
                    //                     data.songDuration != null &&
                    //                     data.songPosition!.inMilliseconds > 0 &&
                    //                     data.songPosition!.inMilliseconds <
                    //                         data.songDuration!.inMilliseconds)
                    //                 ? data.songPosition!.inMilliseconds /
                    //                     data.songDuration!.inMilliseconds
                    //                 : 0.0,
                    //             onChanged: (v) {
                    //               final posi =
                    //                   v * data.songDuration!.inMilliseconds;
                    //               data.seekAudio(
                    //                   Duration(milliseconds: posi.round()));
                    //             },
                    //           );
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Marquee(
                                    fadingEdgeStartFraction: 0.1,
                                    fadingEdgeEndFraction: 0.1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30),
                                    scrollAxis:
                                        Axis.horizontal, //scroll direction
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    blankSpace: 300.0,
                                    velocity: 30.0, //speed
                                    pauseAfterRound: const Duration(seconds: 0),
                                    startPadding: 10.0,
                                    // accelerationDuration: const Duration(seconds: 1),
                                    accelerationCurve: standardEasing,
                                    decelerationDuration:
                                        const Duration(milliseconds: 500),
                                    decelerationCurve: standardEasing,
                                    text:
                                        widget.episode!.itunes!.title ?? 'N/A'))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.rssFeed!.image!.title!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                // fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer<Player>(
                                builder: (BuildContext context, data,
                                    Widget? child) {
                                  return Slider(
                                    activeColor: Colors.white,
                                    inactiveColor: Colors.grey,
                                    value: (data.songPosition != null &&
                                            data.songDuration != null &&
                                            data.songPosition!.inMilliseconds >
                                                0 &&
                                            data.songPosition!.inMilliseconds <
                                                data.songDuration!
                                                    .inMilliseconds)
                                        ? data.songPosition!.inMilliseconds /
                                            data.songDuration!.inMilliseconds
                                        : 0.0,
                                    onChanged: (v) {
                                      final posi =
                                          v * data.songDuration!.inMilliseconds;
                                      data.seekAudio(
                                          Duration(milliseconds: posi.round()));
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.read<Player>().position,
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              context.read<Player>().duration,
                              // value.duration,
                              style: const TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.replay_10)),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                                onPressed: () {
                                  if (isPlaying == false) {
                                    Provider.of<Player>(context, listen: false)
                                        .playAudio(
                                            widget.episode!.enclosure!.url!);
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  } else {
                                    Provider.of<Player>(context, listen: false)
                                        .pauseAudio();
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 40,
                                )),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.forward_10)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.cast),
                            Icon(Icons.share),
                            Icon(Icons.more_vert)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
