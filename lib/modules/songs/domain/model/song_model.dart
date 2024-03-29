import 'package:json_annotation/json_annotation.dart';
part 'song_model.g.dart';

@JsonSerializable()
class Song {
  late String trackName;
  @JsonKey(name: "artworkUrl100")
  late String photo;
  @JsonKey(name: "previewUrl")
  late String songurl;
  @JsonKey(name: "collectionName")
  late String collection;

  static Song SongFROMJSON(Map<String, dynamic> map) => _$SongFromJson(map);
}
