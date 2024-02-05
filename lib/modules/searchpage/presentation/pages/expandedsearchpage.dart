import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:amazonmusiclone/modules/songs/domain/service/song_service.dart';
import 'package:flutter/material.dart';

import '../../../songs/presentation/widgets/song_view.dart';

class ExpandedSearchPage extends StatefulWidget {
  ExpandedSearchPage({super.key});

  @override
  State<ExpandedSearchPage> createState() => _ExpandedSearchPageState();
}

class _ExpandedSearchPageState extends State<ExpandedSearchPage> {
  final _controller = TextEditingController();

  final SongService searchSongService = SongService.getInstance();

  Widget buildSearchBox(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: TextFormField(
        onChanged: (value) {
          searchSongService.getSongs(value).then((result) {
            setState(() {});
          });
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxHeight: 45,
            maxWidth: MediaQuery.of(context).size.width / 1.2,
          ),
          hintText: "Search music and podcasts",
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(40),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        controller: _controller,
        obscureText: false,
      ),
    );
  }

  Widget buildSearchResults(List<Song> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        Song song = songs[index];
        List<Song> songList = songs;
        return SongView(song: song, songlist: songList, index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: buildSearchBox(context),
                ),
              ],
            ),
            FutureBuilder(
              future: searchSongService.getSongs(_controller.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Song> songs = snapshot.data!;
                  return Expanded(child: buildSearchResults(songs));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
