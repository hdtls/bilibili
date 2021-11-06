import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_button_description.dart';
import 'bb_media.dart';
import 'bb_serializers.dart';

export 'bb_button_description.dart';
export 'bb_media.dart';

part 'bb_channel.g.dart';

abstract class Channel implements Built<Channel, ChannelBuilder> {
  // Fields
  
  int? get id;
  
  String? get param;
  
  String? get uri;

  int? get position;

  @BuiltValueField(wireName: "s_type")
  int? get sType;
  
  String? get goto;
  
  String? get title;

  String? get background;

  String? get desc;

  @BuiltValueField(wireName: "card_type")
  String? get cardType;

  @BuiltValueField(wireName: "card_goto")
  String? get cardGoto;
  
  String? get cover;

  @BuiltValueField(wireName: "cover_label")
  String? get coverLabel;

  @BuiltValueField(wireName: "cover_label2")
  String? get coverLabel2;

  int? get alpha;

  @BuiltValueField(wireName: "theme_color")
  String? get themeColor;

  int? get idx;

  ButtonDescription? get button;

  @BuiltValueField(wireName: "official_verify")
  int? get officialVerify;

  String? get name;

  @BuiltValueField(wireName: "desc_button")
  ButtonDescription? get descButton;

  BuiltMap<String, Object>? get args;

  BuiltList<Media>? get items;

  @BuiltValueField(wireName: "desc_1")
  String? get desc1;

  @BuiltValueField(wireName: "desc_button_2")
  ButtonDescription? get descButton2;

  Channel._();

  factory Channel([void Function(ChannelBuilder) updates]) = _$Channel;

  String toJson() {
    return json.encode(serializers.serializeWith(Channel.serializer, this));
  }

  static Channel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Channel.serializer, json.decode(jsonString));
  }

  static Serializer<Channel> get serializer => _$channelSerializer;
}
