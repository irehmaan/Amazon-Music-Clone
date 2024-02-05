import 'package:json_annotation/json_annotation.dart';

part 'trending_song.g.dart';

@JsonSerializable()
class TrendingSong {
  late String trackName;
  @JsonKey(name: "artworkUrl100")
  late String photo;
  @JsonKey(name: "previewUrl")
  late String songurl;
  @JsonKey(name: "collectionName")
  late String collection;

  static TrendingSong TrendingSongFromJson(Map<String, dynamic> map) =>
      _$TrendingSongFromJson(map);
}
