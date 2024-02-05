// ignore_for_file: camel_case_types

import 'package:amazonmusiclone/modules/player/audioPlayer/audioPlayer.dart';
import 'package:amazonmusiclone/modules/player/widgets/upnext.dart';
import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Music_Player extends StatefulWidget {
  late Song song;
  late List<Song>? songs;
  final int initialIndex;

  Music_Player(
      {super.key, required this.song, this.initialIndex = 0, this.songs});

  @override
  State<Music_Player> createState() => _Music_PlayerState();
}

class _Music_PlayerState extends State<Music_Player> {
  int _currentSongIndex = 0;
  bool isFavourite = false;

  @override
  void initState() {
    _currentSongIndex = widget.initialIndex;
    context.read<Player>().playAudio(widget.songs![_currentSongIndex].songurl);
    super.initState();
  }

  void playNextSong() {
    int nextIndex = _currentSongIndex + 1;
    if (nextIndex < widget.songs!.length) {
      setState(() {
        _currentSongIndex = nextIndex;
      });
      context.read<Player>().playAudio(widget.songs![nextIndex].songurl);
    }
  }

  void playPrevioustSong() {
    int prevIndex = _currentSongIndex - 1;
    if (prevIndex >= 0) {
      setState(() {
        _currentSongIndex = prevIndex;
      });
      context.read<Player>().playAudio(widget.songs![prevIndex].songurl);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = Provider.of<Player>(context).isPlaying;
    bool isRepeat = Provider.of<Player>(context).isRepeat;

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<Player>(
          builder: (BuildContext context, Player player, Widget? child) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            if (isPlaying == true) {}
                          },
                          child: const Icon(Icons.arrow_back),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: 310,
                            width: 310,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                widget.songs![_currentSongIndex].photo,
                                height: 350,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Marquee(
                                    fadingEdgeStartFraction: 0.39,
                                    fadingEdgeEndFraction: 0.39,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                    text: widget
                                        .songs![_currentSongIndex].trackName,
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.songs![_currentSongIndex].collection
                                      .substring(
                                          0,
                                          widget.songs![_currentSongIndex]
                                                      .collection.length >
                                                  40
                                              ? 40
                                              : widget.songs![_currentSongIndex]
                                                  .collection.length),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  size: 28,
                                  color:
                                      isFavourite ? Colors.red : Colors.white,
                                ),
                                onPressed: () {
                                  if (isFavourite == false) {
                                    setState(() {
                                      isFavourite = true;
                                    });
                                    const snackBar = SnackBar(
                                      duration: Duration(milliseconds: 600),
                                      content: Text('Added To Favourites'),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    const snackBar = SnackBar(
                                      duration: Duration(milliseconds: 600),
                                      content: Text('Removed From Favourites'),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    setState(() {
                                      isFavourite = false;
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Consumer<Player>(
                              builder:
                                  (BuildContext context, data, Widget? child) {
                                return Slider(
                                  value: (data.songPosition != null &&
                                          data.songDuration != null &&
                                          data.songPosition!.inMilliseconds >
                                              0 &&
                                          data.songPosition!.inMilliseconds <
                                              data.songDuration!.inMilliseconds)
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.read<Player>().position,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                context.read<Player>().duration,
                                // value.duration,
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: playPrevioustSong,
                                icon:
                                    const Icon(Icons.skip_previous, size: 35)),
                            IconButton(
                                onPressed: () {
                                  if (isPlaying == false) {
                                    Provider.of<Player>(context, listen: false)
                                        .playAudio(widget
                                            .songs![_currentSongIndex].songurl);
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  } else {
                                    setState(() {
                                      Provider.of<Player>(context,
                                              listen: false)
                                          .pauseAudio();
                                      isPlaying = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 35)),
                            IconButton(
                                onPressed: playNextSong,
                                icon: const Icon(
                                  Icons.skip_next,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () {
                                  if (isRepeat == false) {
                                    setState(() {
                                      Provider.of<Player>(context,
                                              listen: false)
                                          .repeatAudio();
                                      isRepeat = true;
                                      isPlaying = true;
                                    });
                                  } else {
                                    setState(() {
                                      Provider.of<Player>(context,
                                              listen: false)
                                          .releaseAudio();
                                      isRepeat = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                    isRepeat ? Icons.repeat_one : Icons.repeat,
                                    size: 35)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  widget.songs!.length - _currentSongIndex - 1,
                              itemBuilder: (context, index) {
                                int songIndex = index;
                                Song song = widget.songs![songIndex];
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentSongIndex = songIndex;
                                      });
                                      context
                                          .read<Player>()
                                          .playAudio(song.songurl);
                                    },
                                    child: UpNext(
                                        songs: widget.songs, index: index));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
