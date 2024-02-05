// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingSong _$TrendingSongFromJson(Map<String, dynamic> json) => TrendingSong()
  ..trackName = json['trackName'] as String
  ..photo = json['artworkUrl100'] as String
  ..songurl = json['previewUrl'] as String
  ..collection = json['collectionName'] as String;

Map<String, dynamic> _$TrendingSongToJson(TrendingSong instance) =>
    <String, dynamic>{
      'trackName': instance.trackName,
      'artworkUrl100': instance.photo,
      'previewUrl': instance.songurl,
      'collectionName': instance.collection,
    };
