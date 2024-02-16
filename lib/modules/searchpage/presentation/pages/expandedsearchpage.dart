import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';
import 'package:amazonmusiclone/modules/songs/domain/model/song_model.dart';
import 'package:amazonmusiclone/modules/songs/domain/service/song_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

class ExpandedSearchPage extends StatefulWidget {
  ExpandedSearchPage({Key? key}) : super(key: key);

  @override
  State<ExpandedSearchPage> createState() => _ExpandedSearchPageState();
}

class _ExpandedSearchPageState extends State<ExpandedSearchPage> {
  final _controller = TextEditingController();
  final SongService _searchSongService = SongService.getInstance();
  final GetIt _getIt = GetIt.instance;
  @override
  void initState() {
    super.initState();
    _controller.addListener(_search);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    final searchText = _controller.text.trim();
    if (searchText.isNotEmpty) {
      _searchSongService.getSongs(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: TextFormField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search music and podcasts",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.all(0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      obscureText: false,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Song>>(
                future: _searchSongService.getSongs(_controller.text.trim()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No songs found"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final song = snapshot.data![index];
                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${index + 1}'),
                            ),
                            Image.network(song.photo),
                          ],
                        ),
                        title: Text(song.trackName),
                        subtitle: Text(song.collection),
                        onTap: () {
                          ValueNotifier<bool> hideMiniPlayer =
                              _getIt.get<ValueNotifier<bool>>(
                                  instanceName: 'hideMiniPlayer');
                          hideMiniPlayer.value = true;
                          final ValueNotifier<bool> _extendedPlayer =
                              _getIt.get<ValueNotifier<bool>>(
                                  instanceName: 'extendedPlayer');
                          _extendedPlayer.value = true;
                          context.read<Player>().setPlaylist(snapshot.data!);
                          context.read<Player>().currentIndex = index;
                          final playlist = context.read<Player>().playlist;
                          context
                              .read<Player>()
                              .playAudio(playlist[index].songurl);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
