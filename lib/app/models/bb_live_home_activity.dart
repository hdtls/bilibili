import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_live_home_activity.g.dart';

abstract class LiveHomeActivity
    implements Built<LiveHomeActivity, LiveHomeActivityBuilder> {
  // Fields

  int? get aid; 

  int? get type;

  String? get title;

  @BuiltValueField(wireName: 'logo_url')
  String? get logoUrl;

  @BuiltValueField(wireName: 'start_at')
  int? get startAt;

  @BuiltValueField(wireName: 'end_at')
  int? get endAt;

  @BuiltValueField(wireName: 'time_text')
  String? get timeText;

  @BuiltValueField(wireName: 'button_url')
  String? get buttonUrl;

  @BuiltValueField(wireName: 'button_text')
  String? get buttonText;

  @BuiltValueField(wireName: 'activity_url')
  String? get activityUrl;

  int? get status;

  @BuiltValueField(wireName: 'on_live')
  int? get onLive;

  LiveHomeActivity._();

  factory LiveHomeActivity([void Function(LiveHomeActivityBuilder) updates]) =
      _$LiveHomeActivity;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LiveHomeActivity.serializer, this));
  }

  static LiveHomeActivity? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LiveHomeActivity.serializer, json.decode(jsonString));
  }

  static Serializer<LiveHomeActivity> get serializer =>
      _$liveHomeActivitySerializer;
}
