import 'package:json_annotation/json_annotation.dart';
part 'podcastmodel.g.dart';

@JsonSerializable()
class Podcast {
  @JsonKey(name: "trackName")
  late String podtrack;
  @JsonKey(name: "artworkUrl600")
  late String photo;

  late String feedUrl;
  Podcast(this.podtrack, this.feedUrl, this.photo);
//    static Song SongFROMJSON(Map<String, dynamic> map) => _$SongFromJson(map);
// }
  static Podcast PodcastModelFromJson(Map<String, dynamic> map) =>
      _$PodcastFromJson(map);

  @override
  String toString() {
    // TODO: implement toString
    return "Podcast(podtrack: $podtrack, feedUrl: $feedUrl)";
  }
}
