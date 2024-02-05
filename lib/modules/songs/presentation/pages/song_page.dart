import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:amazonmusiclone/modules/songs/domain/service/song_service.dart';
import 'package:amazonmusiclone/modules/songs/presentation/widgets/song_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Songs extends StatefulWidget {
  String singerName;
  Songs({required this.singerName, super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  final SongService _songService = SongService.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.singerName,
          style: const TextStyle(fontSize: 25),
        ),
        actions: const <Widget>[Icon(Icons.sort_by_alpha)],
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: FutureBuilder(
                  future: _songService.getSongs(widget.singerName),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      // padding: const EdgeInsets.all(3),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Song song = snapshot.data[index];
                        List<Song> songlist = snapshot.data;
                        return SongView(
                            song: song, songlist: songlist, index: index);
                      },
                    );
                  },
                )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
