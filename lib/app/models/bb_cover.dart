import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_cover.g.dart';

abstract class Cover implements Built<Cover, CoverBuilder> {
  // Fields
  String? get url;

  int? get loop;

  @BuiltValueField(wireName: "image_height")
  int? get imageHeight;

  @BuiltValueField(wireName: "image_width")
  int? get imageWidth;

  Cover._();

  factory Cover([void Function(CoverBuilder) updates]) = _$Cover;

  String toJson() {
    return json.encode(serializers.serializeWith(Cover.serializer, this));
  }

  static Cover? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Cover.serializer, json.decode(jsonString));
  }

  static Serializer<Cover> get serializer => _$coverSerializer;
}
