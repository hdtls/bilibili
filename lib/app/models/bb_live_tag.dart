import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_live_tag.g.dart';

abstract class LiveTag implements Built<LiveTag, LiveTagBuilder> {
  // Fields
  int? get id;
  
  String? get link;

  String? get pic;

  String? get title;

  @BuiltValueField(wireName: 'area_v2_id')
  int? get areaV2Id;

  @BuiltValueField(wireName: 'area_v2_parent_id')
  int? get areaV2ParentId;

  @BuiltValueField(wireName: 'tag_type')
  int? get tagType;

  LiveTag._();

  factory LiveTag([void Function(LiveTagBuilder) updates]) = _$LiveTag;

  String toJson() {
    return json.encode(serializers.serializeWith(LiveTag.serializer, this));
  }

  static LiveTag? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LiveTag.serializer, json.decode(jsonString));
  }

  static Serializer<LiveTag> get serializer => _$liveTagSerializer;
}
