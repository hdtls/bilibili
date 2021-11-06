import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_advertisement_creative_content.g.dart';

abstract class AdvertisementCreativeContent
    implements
        Built<AdvertisementCreativeContent,
            AdvertisementCreativeContentBuilder> {
  // Fields
  String? get title;
  String get description;

  @BuiltValueField(wireName: "image_url")
  String? get imageUrl;
  
  @BuiltValueField(wireName: "image_md5")
  String? get imageMd5;
  String? get url;

  @BuiltValueField(wireName: "click_url")
  String? get clickUrl;

  @BuiltValueField(wireName: "show_url")
  String? get showUrl;

  AdvertisementCreativeContent._();

  factory AdvertisementCreativeContent(
          [void Function(AdvertisementCreativeContentBuilder) updates]) =
      _$AdvertisementCreativeContent;

  String toJson() {
    return json.encode(serializers.serializeWith(
        AdvertisementCreativeContent.serializer, this));
  }

  static AdvertisementCreativeContent? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AdvertisementCreativeContent.serializer, json.decode(jsonString));
  }

  static Serializer<AdvertisementCreativeContent> get serializer =>
      _$advertisementCreativeContentSerializer;
}
