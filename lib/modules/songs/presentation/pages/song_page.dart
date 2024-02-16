import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';
import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:amazonmusiclone/modules/songs/domain/service/song_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Songs extends StatelessWidget {
  String? singerName;
  Songs({this.singerName, super.key});

  final SongService _songService = SongService.getInstance();
  final GetIt _getIt = GetIt.instance;
  dynamic playListProvider;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          singerName!,
          style: const TextStyle(fontSize: 25),
        ),
        actions: const <Widget>[Icon(Icons.sort_by_alpha)],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: _songService.getSongs(singerName!),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Consumer<Player>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Song song = snapshot.data[index];
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${index + 1}".toString()),
                                ),
                                Image.network(song.photo),
                              ],
                            ),
                            title: Text(song.trackName.substring(
                              0,
                              song.trackName.length > 30
                                  ? 30
                                  : song.trackName.length,
                            )),
                            subtitle: Text(song.collection),
                            trailing: const Icon(Icons.play_circle),
                            onTap: () {
                              final ValueNotifier<bool> hideMiniPlayer =
                                  _getIt.get<ValueNotifier<bool>>(
                                      instanceName: 'hideMiniPlayer');
                              hideMiniPlayer.value = true;
                              final ValueNotifier<bool> _extendedPlayer =
                                  _getIt.get<ValueNotifier<bool>>(
                                      instanceName: 'extendedPlayer');
                              _extendedPlayer.value = true;
                              context.read<Player>().setPlaylist(snapshot.data);
                              context.read<Player>().currentIndex = index;
                              final playlist = context.read<Player>().playlist;
                              context
                                  .read<Player>()
                                  .playAudio(playlist[index].songurl);
                            },
                            // isThreeLine: true,
                          );
                        },
                      );
                    },
                  );
                },
              )),
            ],
          )
        ],
      )),
    );
  }
}
