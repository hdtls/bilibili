import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_bangumi_status.dart';
import 'bb_copyright.dart';
import 'bb_dimension.dart';
import 'bb_serializers.dart';

part 'bb_episode.g.dart';

abstract class Episode implements Built<Episode, EpisodeBuilder> {
  // Fields
  int? get aid;

  String? get badge;
  
  @BuiltValueField(wireName: "badge_type")
  int? get badgeType;

  String? get bvid;

  int? get cid;
  
  String? get cover;

  Dimension? get dimension;
  
  String? get from;
  
  int? get id;

  String? get link;

  @BuiltValueField(wireName: "long_title")
  String? get longTitle;

  @BuiltValueField(wireName: "movie_title")
  String? get movieTitle;

  @BuiltValueField(wireName: "release_date")
  String? get releaseDate;

  Copyright? get rights;

  @BuiltValueField(wireName: "share_copy")
  String? get shareCopy;

  @BuiltValueField(wireName: "share_url")
  String? get shareUrl;

  @BuiltValueField(wireName: "short_link")
  String? get shortLink;

  BangumiStatus? get stat;

  int? get status;
  
  String? get subtitle;
  
  String? get title;

  String? get vid;

  Episode._();

  factory Episode([void Function(EpisodeBuilder) updates]) = _$Episode;

  String toJson() {
    return json.encode(serializers.serializeWith(Episode.serializer, this));
  }

  static Episode? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Episode.serializer, json.decode(jsonString));
  }

  static Serializer<Episode> get serializer => _$episodeSerializer;
}
