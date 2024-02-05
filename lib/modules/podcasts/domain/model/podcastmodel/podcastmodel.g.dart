// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcastmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) => Podcast(
      json['trackName'] ?? '',
      json['feedUrl'] ?? '',
      json['artworkUrl600'] ?? '',
    );

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'trackName': instance.podtrack,
      'artworkUrl600': instance.photo,
      'feedUrl': instance.feedUrl,
    };
