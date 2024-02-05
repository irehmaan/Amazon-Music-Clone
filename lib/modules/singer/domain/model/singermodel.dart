// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
part 'singermodel.g.dart';

@JsonSerializable()
class Singer {
  late String name;
  late String photo;

  static Singer SingerFromJson(Map<String, dynamic> map) =>
      _$SingerFromJson(map);
}
