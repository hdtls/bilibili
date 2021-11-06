import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_trailer.g.dart';

abstract class Trailer implements Built<Trailer, TrailerBuilder> {
  // Fields
  String? get cover;

  int? get delay;

  @BuiltValueField(wireName: "delay_id")
  int? get delayId;

  @BuiltValueField(wireName: "delay_index")
  String? get delayIndex;

  @BuiltValueField(wireName: "delay_reason")
  String? get delayReason;

  @BuiltValueField(wireName: "episode_id")
  int? get episodeId;

  String? get link;

  @BuiltValueField(wireName: "pub_index")
  String? get pubIndex;

  @BuiltValueField(wireName: "pub_time")
  String? get pubTime;

  @BuiltValueField(wireName: "pub_ts")
  int? get pubTs;

  int? get published;

  @BuiltValueField(wireName: "season_id")
  int? get seasonId;

  @BuiltValueField(wireName: "season_type")
  int? get seasonType;

  @BuiltValueField(wireName: "square_cover")
  String? get squareCover;
  
  String? get title;

  Trailer._();

  factory Trailer([void Function(TrailerBuilder) updates]) = _$Trailer;

  String toJson() {
    return json.encode(serializers.serializeWith(Trailer.serializer, this));
  }

  static Trailer? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Trailer.serializer, json.decode(jsonString));
  }

  static Serializer<Trailer> get serializer => _$trailerSerializer;
}
