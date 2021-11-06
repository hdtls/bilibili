import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';
import 'bb_source_content.dart';

export 'bb_source_content.dart';

part 'bb_live_home_ad.g.dart';

abstract class LiveHomeAd implements Built<LiveHomeAd, LiveHomeAdBuilder> {
  // Fields
  int get id;

  String? get link;
  
  String? get pic;

  String? get title;

  String? get content;

  @BuiltValueField(wireName: 'source_content')
  SourceContent? get sourceContent;

  LiveHomeAd._();

  factory LiveHomeAd([void Function(LiveHomeAdBuilder) updates]) = _$LiveHomeAd;

  String toJson() {
    return json.encode(serializers.serializeWith(LiveHomeAd.serializer, this));
  }

  static LiveHomeAd? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LiveHomeAd.serializer, json.decode(jsonString));
  }

  static Serializer<LiveHomeAd> get serializer => _$liveHomeAdSerializer;
}
