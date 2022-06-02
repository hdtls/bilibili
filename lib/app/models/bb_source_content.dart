import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

import 'bb_advertisement.dart';

export 'bb_advertisement.dart';

part 'bb_source_content.g.dart';

abstract class SourceContent
    implements Built<SourceContent, SourceContentBuilder> {
  // Fields

  @BuiltValueField(wireName: "card_index")
  int? get cardIndex;

  @BuiltValueField(wireName: "client_ip")
  String? get clientIp;

  int? get index;

  @BuiltValueField(wireName: "is_ad_loc")
  JsonObject? get isAdLoc;

  @BuiltValueField(wireName: "request_id")
  String? get requestId;

  @BuiltValueField(wireName: "resource_id")
  int? get resourceId;

  @BuiltValueField(wireName: "server_type")
  int? get serverType;

  @BuiltValueField(wireName: "source_id")
  int? get sourceId;

  @BuiltValueField(wireName: "ad_content")
  Advertisement? get ad;

  SourceContent._();

  factory SourceContent([void Function(SourceContentBuilder) updates]) =
      _$SourceContent;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SourceContent.serializer, this));
  }

  static SourceContent? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SourceContent.serializer, json.decode(jsonString));
  }

  static Serializer<SourceContent> get serializer => _$sourceContentSerializer;
}
