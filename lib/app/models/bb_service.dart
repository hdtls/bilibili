import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_service.g.dart';

abstract class Service implements Built<Service, ServiceBuilder> {
  // Fields
  
  int? get display;

  String? get title;

  String? get icon;

  @BuiltValueField(wireName: "need_login")
  int? get needLogin;
  
  String? get uri;

  @BuiltValueField(wireName: "global_red_dot")
  int? get globalRedDot;

  @BuiltValueField(wireName: "red_dot")
  int? get redDot;
  
  int? get id;

  Service._();

  factory Service([void Function(ServiceBuilder) updates]) = _$Service;

  String toJson() {
    return json.encode(serializers.serializeWith(Service.serializer, this));
  }

  static Service? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Service.serializer, json.decode(jsonString));
  }

  static Serializer<Service> get serializer => _$serviceSerializer;
}
