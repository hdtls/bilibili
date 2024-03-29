import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_paster.g.dart';

abstract class Paster implements Built<Paster, PasterBuilder> {
  // Fields
  int? get aid;

  @BuiltValueField(wireName: "allow_jump")
  int? get allowJump;

  int? get cid; 
  
  int? get duration;

  int? get type;
  
  String? get url;

  Paster._();

  factory Paster([void Function(PasterBuilder) updates]) = _$Paster;

  String toJson() {
    return json.encode(serializers.serializeWith(Paster.serializer, this));
  }

  static Paster? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Paster.serializer, json.decode(jsonString));
  }

  static Serializer<Paster> get serializer => _$pasterSerializer;
}
