import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_argument.g.dart';

abstract class Argument implements Built<Argument, ArgumentBuilder> {
  // Fields

  @BuiltValueField(wireName: "up_id")
  int? get upId;

  @BuiltValueField(wireName: "up_name")
  String? get upName;
  
  int? get rid;
  String? get rname;
  int? get tid;
  String? get tname;
  int? get aid;
  int? get cid;
  String? get type;

  Argument._();

  factory Argument([void Function(ArgumentBuilder) updates]) = _$Argument;

  String toJson() {
    return json.encode(serializers.serializeWith(Argument.serializer, this));
  }

  static Argument? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Argument.serializer, json.decode(jsonString));
  }

  static Serializer<Argument> get serializer => _$argumentSerializer;
}
