import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'bb_ad_tag_style.dart';
import 'bb_cover.dart';
import 'bb_feedback_panel.dart';
import 'bb_serializers.dart';

export 'bb_ad_tag_style.dart';
export 'bb_cover.dart';
export 'bb_feedback_panel.dart';

part 'bb_card.g.dart';

abstract class Card implements Built<Card, CardBuilder> {
  // Fields

  @BuiltValueField(wireName: "card_type")
  int? get cardType;

  String? get title;

  BuiltList<Cover>? get covers;

  @BuiltValueField(wireName: "jump_url")
  String? get jumpUrl;

  String? get desc;

  @BuiltValueField(wireName: "callup_url")
  String? get callupUrl;

  @BuiltValueField(wireName: "long_desc")
  String? get longDesc;

  @BuiltValueField(wireName: "ad_tag")
  String? get adTag;

  @BuiltValueField(wireName: "extra_desc")
  String? get extraDesc;

  @BuiltValueField(wireName: "ad_tag_style")
  AdTagStyle? get adTagStyle;

  @BuiltValueField(wireName: "feedback_panel")
  FeedbackPanel? get feedbackPanel;

  Card._();

  factory Card([void Function(CardBuilder) updates]) = _$Card;

  String toJson() {
    return json.encode(serializers.serializeWith(Card.serializer, this));
  }

  static Card? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Card.serializer, json.decode(jsonString));
  }

  static Serializer<Card> get serializer => _$cardSerializer;
}
