import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_publish.g.dart';

abstract class Publish implements Built<Publish, PublishBuilder> {
  // Fields

  @BuiltValueField(wireName: "is_finish")
  int? get isFinish;

  @BuiltValueField(wireName: "is_started")
  int? get isStarted;

  @BuiltValueField(wireName: "pub_time")
  String? get pubTime;

  @BuiltValueField(wireName: "pub_time_show")
  String? get pubTimeShow;

  @BuiltValueField(wireName: "release_date_show")
  String? get releaseDateShow;

  @BuiltValueField(wireName: "time_length_show")
  String? get timeLengthShow;

  @BuiltValueField(wireName: "unknow_pub_date")
  int? get unknowPubDate;
  
  int? get weekday;

  Publish._();

  factory Publish([void Function(PublishBuilder) updates]) = _$Publish;

  String toJson() {
    return json.encode(serializers.serializeWith(Publish.serializer, this));
  }

  static Publish? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Publish.serializer, json.decode(jsonString));
  }

  static Serializer<Publish> get serializer => _$publishSerializer;
}
