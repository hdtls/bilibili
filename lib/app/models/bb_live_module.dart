import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_live_module.g.dart';

abstract class LiveModule implements Built<LiveModule, LiveModuleBuilder> {
  // Fields
  int? get id;

  String? get link;
  
  String? get pic;

  String? get title;
  
  int? get type;  
  
  int? get sort;

  int? get count;

  LiveModule._();

  factory LiveModule([void Function(LiveModuleBuilder) updates]) = _$LiveModule;

  String toJson() {
    return json.encode(serializers.serializeWith(LiveModule.serializer, this));
  }

  static LiveModule? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LiveModule.serializer, json.decode(jsonString));
  }

  static Serializer<LiveModule> get serializer => _$liveModuleSerializer;
}
