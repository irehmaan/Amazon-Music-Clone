import 'package:amazonmusiclone/modules/player/widgets/upnext.dart';
import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:marquee/marquee.dart';

// ignore: must_be_immutable
class MusicPlayer extends StatefulWidget {
  late Song song;
  late List<Song>? songs;
  final int initialIndex;

  MusicPlayer({
    required this.song,
    super.key,
    this.songs,
    this.initialIndex = 0,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  int _currentSongIndex = 0;
  bool _isPlaying = false;
  bool _isloop = false;
  late AudioPlayer audioPlayer;

  Duration? _duration;
  Duration? _position;
  get _durationText => _duration?.toString().split('.').first ?? '';
  get _positionText => _position?.toString().split('.').first ?? '';

  Color color = Colors.white;

  @override
  void initState() {
    _currentSongIndex = widget.initialIndex;

    _initAudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    audioPlayer = AudioPlayer();

    // playAudio(widget.song.songurl);

    playAudio(widget.songs![_currentSongIndex].songurl);
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((p) => setState(() {
          _position = p;
        }));

    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed && _isloop) {
        audioPlayer.setReleaseMode(ReleaseMode.loop);
      } else if (event == PlayerState.completed) {
        setState(() {
          audioPlayer.setReleaseMode(ReleaseMode.release);
          _position = const Duration(seconds: 0);
          _duration = const Duration(seconds: 0);
          _isPlaying = false;
          playNextSong();
        });
      }
    });
  }

  playAudio(path) async {
    await audioPlayer.play(UrlSource(path));

    setState(() {
      _isPlaying = true;
    });
  }

  pauseAudio() async {
    await audioPlayer.pause();

    setState(() {
      _isPlaying = false;
    });
  }

  stopAudio() async {
    await audioPlayer.stop();

    setState(() {
      _position = Duration.zero;
      _isPlaying = false;
    });
  }

  resumeAudio() async {
    await audioPlayer.resume();

    setState(() {
      _isPlaying = true;
    });
  }

  void playNextSong() {
    int nextIndex = _currentSongIndex + 1;
    if (nextIndex < widget.songs!.length) {
      setState(() {
        _currentSongIndex = nextIndex;
      });
      playAudio(widget.songs![nextIndex].songurl);
    }
  }

  void playPrevioustSong() {
    int prevIndex = _currentSongIndex - 1;
    if (prevIndex >= 0) {
      setState(() {
        _currentSongIndex = prevIndex;
      });
      playAudio(widget.songs![prevIndex].songurl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            audioPlayer.stop();
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back),
                        )
                      ],
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
                        height: 340,
                        width: 340,
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
                                    fontWeight: FontWeight.bold, fontSize: 30),
                                scrollAxis: Axis.horizontal, //scroll direction
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    widget.songs![_currentSongIndex].trackName,
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
                          const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey.shade500,
                      thumbColor: Colors.grey.shade300,
                      onChanged: (v) {
                        // ignore: non_constant_identifier_names
                        final Position = v * _duration!.inMilliseconds;
                        audioPlayer
                            .seek(Duration(milliseconds: Position.round()));
                      },
                      value: (_position != null &&
                              _duration != null &&
                              _position!.inMilliseconds > 0 &&
                              _position!.inMilliseconds <
                                  _duration!.inMilliseconds)
                          ? _position!.inMilliseconds /
                              _duration!.inMilliseconds
                          : 0.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          _position != null
                              ? '${_positionText ?? ''}'
                              : _duration != null
                                  ? _durationText
                                  : '',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(
                          width: 135,
                        ),
                        Text(
                          _position != null
                              ? '${_durationText ?? ''}'
                              : _duration != null
                                  ? _durationText
                                  : '',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        _isloop ? Icons.repeat_one : Icons.repeat,
                        color: color,
                        size: 35,
                      ),
                      onPressed: () {
                        if (_isloop == false) {
                          audioPlayer.setReleaseMode(ReleaseMode.loop);
                          setState(() {
                            _isloop = true;
                            color = Colors.white;
                          });
                        } else if (_isloop == true) {
                          audioPlayer.setReleaseMode(ReleaseMode.release);
                          setState(() {
                            _isloop = false;
                            color = Colors.grey.shade400;
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous_outlined,
                        size: 35,
                      ),
                      onPressed: playPrevioustSong,
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        color: _isPlaying ? Colors.white : Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        if (_isPlaying == false) {
                          resumeAudio();
                        } else {
                          pauseAudio();
                        }
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next_outlined,
                        size: 35,
                      ),
                      onPressed: playNextSong,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shuffle,
                        size: 35,
                      ),
                      onPressed: () async {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: widget.songs!.length - _currentSongIndex - 1,
                      itemBuilder: (context, index) {
                        int songIndex = index;
                        Song song = widget.songs![songIndex];
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentSongIndex = songIndex;
                              });
                              playAudio(song.songurl);
                            },
                            child: UpNext(songs: widget.songs, index: index));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
