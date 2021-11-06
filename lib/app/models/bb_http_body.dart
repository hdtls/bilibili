import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'bb_serializers.dart';

part 'bb_http_body.g.dart';

abstract class HttpBody<Body>
    implements Built<HttpBody<Body>, HttpBodyBuilder<Body>> {
  
  int? get code;
  
  String? get message;
  
  int? get ttl;

  Body? get data;

  Body? get result;

  HttpBody._();

  factory HttpBody([void Function(HttpBodyBuilder<Body>) updates]) =
      _$HttpBody<Body>;

  String toJson() {
    return json.encode(serializers.serialize(this,
        specifiedType: FullType(HttpBody, [FullType(Body)])));
  }

  static HttpBody<Body>? fromJson<Body>(String jsonString) {
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: FullType(HttpBody, [FullType(Body)]),
    ) as HttpBody<Body>?;
  }

  static Serializer<HttpBody> get serializer => _$httpBodySerializer;
}

abstract class HttpListBody<Body>
    implements Built<HttpListBody<Body>, HttpListBodyBuilder<Body>> {
  // Fields
  int? get code;

  String? get message;
  
  int? get ttl;

  BuiltList<Body>? get data;

  HttpListBody._();

  factory HttpListBody([void Function(HttpListBodyBuilder<Body>) updates]) =
      _$HttpListBody<Body>;

  String toJson() {
    return json.encode(serializers.serialize(this,
        specifiedType: FullType(HttpListBody, [FullType(Body)])));
  }

  static HttpListBody<Body>? fromJson<Body>(String jsonString) {
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: FullType(
        HttpListBody,
        [FullType(Body)],
      ),
    ) as HttpListBody<Body>?;
  }

  static Serializer<HttpListBody> get serializer => _$httpListBodySerializer;
}
