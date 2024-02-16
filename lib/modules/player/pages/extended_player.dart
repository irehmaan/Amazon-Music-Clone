import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';
import 'package:amazonmusiclone/modules/player/widgets/upnext.dart';
import 'package:amazonmusiclone/settings/themes/light_theme.dart';
import 'package:amazonmusiclone/settings/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../miniplayer/pages/miniplayer.dart';

class ExtendedPlayer extends StatelessWidget {
  ExtendedPlayer({super.key});

  final GetIt _getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ValueNotifier<bool> _extendedPlayer =
        _getIt.get<ValueNotifier<bool>>(instanceName: 'extendedPlayer');

    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          _extendedPlayer.value = false;
        },
        child: GestureDetector(
          onTap: () {
            _extendedPlayer.value = true;
          },
          child: ValueListenableBuilder(
            builder: (context, value, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.linearToEaseOut,
                color: context.read<ThemeProvider>().themeData == lighTheme
                    ? Colors.grey.shade700
                    : Colors.black,
                height: value ? size.height : size.height / 12.5,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Visibility(
                            visible: value,
                            child: IconButton(
                                onPressed: () {
                                  _extendedPlayer.value = false;
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                )),
                          )
                        ],
                      ),
                      _extendedPlayer.value
                          ? GestureDetector(
                              onVerticalDragUpdate: (details) {
                                _extendedPlayer.value = false;
                              },
                              child: Consumer<Player>(
                                builder: (context, player, child) {
                                  final playlist = player.playlist;
                                  final index = player.currentIndex;
                                  return Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  height: 310,
                                                  width: 310,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Image.network(
                                                      playlist[index!].photo,
                                                      height: 350,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25,
                                                        vertical: 8),
                                                child: SizedBox(
                                                  height: 50,
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Marquee(
                                                          fadingEdgeStartFraction:
                                                              0.39,
                                                          fadingEdgeEndFraction:
                                                              0.39,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 30),
                                                          scrollAxis: Axis
                                                              .horizontal, //scroll direction
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          blankSpace: 300.0,
                                                          velocity:
                                                              30.0, //speed
                                                          pauseAfterRound:
                                                              const Duration(
                                                                  seconds: 0),
                                                          startPadding: 10.0,
                                                          // accelerationDuration: const Duration(seconds: 1),
                                                          accelerationCurve:
                                                              standardEasing,
                                                          decelerationDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          decelerationCurve:
                                                              standardEasing,
                                                          text: playlist[index]
                                                              .trackName,
                                                        ),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        playlist[index].collection.substring(
                                                            0,
                                                            playlist[index]
                                                                        .collection
                                                                        .length >
                                                                    60
                                                                ? 30
                                                                : playlist[
                                                                        index]
                                                                    .collection
                                                                    .length),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        size: 28,
                                                        color: player.isFav
                                                            ? Colors.red
                                                            : Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        if (!player.isFav) {
                                                          player
                                                              .favouriteSong();
                                                          const snackBar =
                                                              SnackBar(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            content: Text(
                                                                'Added To Favourites'),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        } else {
                                                          player.unfavSong();
                                                          const snackBar =
                                                              SnackBar(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            content: Text(
                                                                'Removed From Favourites'),
                                                          );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Slider(
                                                    value: (player.songPosition != null &&
                                                            player.songDuration !=
                                                                null &&
                                                            player.songPosition!
                                                                    .inMilliseconds >
                                                                0 &&
                                                            player.songPosition!
                                                                    .inMilliseconds <
                                                                player
                                                                    .songDuration!
                                                                    .inMilliseconds)
                                                        ? player.songPosition!
                                                                .inMilliseconds /
                                                            player.songDuration!
                                                                .inMilliseconds
                                                        : 0.0,
                                                    onChanged: (v) {
                                                      final posi = v *
                                                          player.songDuration!
                                                              .inMilliseconds;
                                                      player.seekAudio(Duration(
                                                          milliseconds:
                                                              posi.round()));
                                                    },
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      context
                                                          .read<Player>()
                                                          .position,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      context
                                                          .read<Player>()
                                                          .duration,
                                                      // value.duration,
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: context
                                                          .read<Player>()
                                                          .previouSong,
                                                      icon: const Icon(
                                                          Icons.skip_previous,
                                                          size: 35)),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (player.isPlaying) {
                                                          player.pauseAudio();
                                                        } else {
                                                          player.playAudio(
                                                              playlist[index]
                                                                  .songurl);
                                                        }
                                                      },
                                                      icon: Icon(
                                                          player.isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          size: 35)),
                                                  IconButton(
                                                      onPressed: context
                                                          .read<Player>()
                                                          .playNext,
                                                      icon: const Icon(
                                                        Icons.skip_next,
                                                        size: 35,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (!player.isRepeat) {
                                                          player.repeatAudio();
                                                        } else {
                                                          player.releaseAudio();
                                                        }
                                                      },
                                                      icon: Icon(
                                                          player.isRepeat
                                                              ? Icons.repeat_one
                                                              : Icons.repeat,
                                                          size: 35)),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text("Up Next"),
                                              SizedBox(
                                                  height: 200,
                                                  width: size.width,
                                                  child: UpNext())
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                          : const MiniPlayer()
                    ],
                  ),
                ),
              );
            },
            valueListenable: _extendedPlayer,
          ),
        ));
  }
}
