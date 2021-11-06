import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_new_ep.g.dart';

abstract class NewEp implements Built<NewEp, NewEpBuilder> {
  // Fields
  String? get cover;

  int? get id;

  String? get desc;

  @BuiltValueField(wireName: "is_new")
  int? get isNew;

  String? get more;
  
  String? get title;

  @BuiltValueField(wireName: "index_show")
  String? get indexShow;

  NewEp._();

  factory NewEp([void Function(NewEpBuilder) updates]) = _$NewEp;

  String toJson() {
    return json.encode(serializers.serializeWith(NewEp.serializer, this));
  }

  static NewEp? fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewEp.serializer, json.decode(jsonString));
  }

  static Serializer<NewEp> get serializer => _$newEpSerializer;
}
