import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_season.g.dart';

abstract class Season implements Built<Season, SeasonBuilder> {
  // Fields

  String? get badge;

  int? get badgeType;

  String? get cover;

  int? get isNew;

  String? get link;
  
  String? get resource;
  
  int? get seasonId;
  
  String? get seasonTitle;
  
  String? get title;

  Season._();

  factory Season([void Function(SeasonBuilder) updates]) = _$Season;

  String toJson() {
    return json.encode(serializers.serializeWith(Season.serializer, this));
  }

  static Season? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Season.serializer, json.decode(jsonString));
  }

  static Serializer<Season> get serializer => _$seasonSerializer;
}
