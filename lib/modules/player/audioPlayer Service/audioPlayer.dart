import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../songs/domain/model/song_model.dart';

// ignore: constant_identifier_names
enum AudioSate { PLAYING, PAUSED, REPEAT, RESUME, STOPPED }

class Player with ChangeNotifier {
  // get the playlist
  List<Song> _playlist = [];

  int? _currentIndex;
  bool isPaused = false;
  bool enableMiniPlayer = true;
  bool hideNavigationBar = false;
  bool _isPlaying = false;
  bool _isRepeat = false;
  bool _isFav = false;


  bool extendedPlayer = false;

  // getters
  List<Song> get playlist => _playlist;
  int? get currentIndex => _currentIndex;

  bool get isPlaying => _isPlaying;
  bool get isRepeat => _isRepeat;
  bool get isFav => _isFav;

  // setters
  set currentIndex(int? newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  void setPlaylist(List<Song> newPlaylist) {
    _playlist = newPlaylist;
    notifyListeners();
  }

  Duration? _duration;
  Duration? _position;
  Duration? get songDuration => _duration;
  Duration? get songPosition => _position;
  get _durationText => _duration?.toString().split('.').first ?? '';
  get _positionText => _position?.toString().split('.').first ?? '';
  final AudioSate _audioSate = AudioSate.STOPPED;
  AudioSate get audioState => _audioSate;
  AudioPlayer audioPlayer = AudioPlayer();

  get position => _positionText;
  get duration => _durationText;

  Player() {
    audioPlayer.onPositionChanged.listen((p) {
      _position = p;
      notifyListeners();
    });

    audioPlayer.onDurationChanged.listen((d) {
      _duration = d;
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed) {
        _position = const Duration(seconds: 0);
        // enableMiniPlayer = false;
        _isPlaying = false;

        notifyListeners();
      }
    });
  }

  Future<void> playAudio(String url) async {
    // await audioPlayer.stop();
    await audioPlayer.play(UrlSource(url));
    _isPlaying = true;
    notifyListeners();
  }

  // playAssetAudio(String url) async {
  //   await audioPlayer.play(AssetSource(url));

  //   notifyListeners();
  // }

  pauseAudio() async {
    await audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  releaseAudio() async {
    await audioPlayer.setReleaseMode(ReleaseMode.release);
    _isRepeat = false;

    notifyListeners();
  }

  repeatAudio() async {
    await audioPlayer.setReleaseMode(ReleaseMode.loop);
    _isRepeat = true;
    notifyListeners();
  }

  favouriteSong() {
    _isFav = true;
    notifyListeners();
  }

  unfavSong() {
    _isFav = false;
    notifyListeners();
  }

  void stopAudio() async {
    audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }

  void playNext() {
    int nextIndex = _currentIndex! + 1;
    if (nextIndex < _playlist.length) {
      _currentIndex = nextIndex;
      playAudio(_playlist[nextIndex].songurl);
      notifyListeners();
    }

    // if (_currentIndex != null) {
    //   if (_currentIndex! < _playlist.length - 1) {
    //     currentIndex = _currentIndex! + 1;
    //   } else {
    //     currentIndex = 0;
    //   }
    // }
  }

  void previouSong() {
    int prevIndex = _currentIndex! - 1;
    if (prevIndex >= 0) {
      _currentIndex = prevIndex;
      playAudio(_playlist[prevIndex].songurl);
    }
    notifyListeners();
  }

  seekAudio(Duration position) async {
    await audioPlayer.seek(position);
    notifyListeners();
  }

  playForward() async {
    await audioPlayer.seek(position);
  }
}
