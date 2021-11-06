import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_tag.g.dart';

abstract class Tag implements Built<Tag, TagBuilder> {
  // Fields
  int get id;
  
  String? get name;

  String? get url;

  Tag._();

  factory Tag([void Function(TagBuilder) updates]) = _$Tag;

  String toJson() {
    return json.encode(serializers.serializeWith(Tag.serializer, this));
  }

  static Tag? fromJson(String jsonString) {
    return serializers.deserializeWith(Tag.serializer, json.decode(jsonString));
  }

  static Serializer<Tag> get serializer => _$tagSerializer;
}
