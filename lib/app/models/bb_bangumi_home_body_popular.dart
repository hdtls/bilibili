import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_bangumi_home_body_popular.g.dart';

abstract class BangumiHomeBodyPopular
    implements Built<BangumiHomeBodyPopular, BangumiHomeBodyPopularBuilder> {
  // Fields
  String? get desc;

  BuiltList<dynamic>? get items;
  String? get title;
  int? get wid;

  BangumiHomeBodyPopular._();

  factory BangumiHomeBodyPopular(
          [void Function(BangumiHomeBodyPopularBuilder) updates]) =
      _$BangumiHomeBodyPopular;

  String toJson() {
    return json.encode(
        serializers.serializeWith(BangumiHomeBodyPopular.serializer, this));
  }

  static BangumiHomeBodyPopular? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BangumiHomeBodyPopular.serializer, json.decode(jsonString));
  }

  static Serializer<BangumiHomeBodyPopular> get serializer =>
      _$bangumiHomeBodyPopularSerializer;
}
