import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';
import 'bb_advertisement_creative_content.dart';
import 'bb_extra.dart';

export 'bb_serializers.dart';
export 'bb_advertisement_creative_content.dart';
export 'bb_extra.dart';

part 'bb_advertisement.g.dart';

abstract class Advertisement
    implements Built<Advertisement, AdvertisementBuilder> {
  // Fields

  @BuiltValueField(wireName: "creative_id")
  int? get creativeId;

  @BuiltValueField(wireName: "creative_type")
  int? get creativeType;

  @BuiltValueField(wireName: "card_type")
  int? get cardType;

  @BuiltValueField(wireName: "creative_content")
  AdvertisementCreativeContent? get creativeContent;

  @BuiltValueField(wireName: "ad_cb")
  String? get adCb;
  
  int? get resource; 
  int? get source;

  @BuiltValueField(wireName: "request_id")
  String? get requestId;

  @BuiltValueField(wireName: "is_ad")
  bool? get isAd;

  @BuiltValueField(wireName: "cm_mark")
  int? get cmMark;
  int? get index;

  @BuiltValueField(wireName: "is_ad_loc")
  bool? get isAdLoc;

  @BuiltValueField(wireName: "card_index")
  int? get cardIndex;

  @BuiltValueField(wireName: "client_ip")
  String? get clientIp;

  Extra? get extra;

  @BuiltValueField(wireName: "creative_style")
  int? get creativeStyle;

  Advertisement._();

  factory Advertisement([void Function(AdvertisementBuilder) updates]) =
      _$Advertisement;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Advertisement.serializer, this));
  }

  static Advertisement? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Advertisement.serializer, json.decode(jsonString));
  }

  static Serializer<Advertisement> get serializer => _$advertisementSerializer;
}
