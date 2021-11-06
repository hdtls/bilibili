import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_watch_progress.g.dart';

abstract class WatchProgress
    implements Built<WatchProgress, WatchProgressBuilder> {
  // Fields
  int? get bar;

  @BuiltValueField(wireName: "last_ep_desc")
  String? get lastEpDesc;

  @BuiltValueField(wireName: "last_ep_id")
  int? get lastEpId;

  @BuiltValueField(wireName: "last_ep_index")
  String? get lastEpIndex;

  @BuiltValueField(wireName: "last_time")
  int? get lastTime;

  WatchProgress._();

  factory WatchProgress([void Function(WatchProgressBuilder) updates]) =
      _$WatchProgress;

  String toJson() {
    return json
        .encode(serializers.serializeWith(WatchProgress.serializer, this));
  }

  static WatchProgress? fromJson(String jsonString) {
    return serializers.deserializeWith(
        WatchProgress.serializer, json.decode(jsonString));
  }

  static Serializer<WatchProgress> get serializer => _$watchProgressSerializer;
}
