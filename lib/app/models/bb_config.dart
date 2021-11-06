import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_config.g.dart';

abstract class Config implements Built<Config, ConfigBuilder> {
  // Fields
  int? get column;

  @BuiltValueField(wireName: "autoplay_card")
  int? get autoplayCard;

  @BuiltValueField(wireName: "feed_clean_abtest")
  int? get feedCleanAbtest;

  @BuiltValueField(wireName: "home_transfer_test")
  int? get homeTransferTest;

  @BuiltValueField(wireName: "auto_refresh_time")
  int? get autoRefreshTime;

  Config._();

  factory Config([void Function(ConfigBuilder) updates]) = _$Config;

  String toJson() {
    return json.encode(serializers.serializeWith(Config.serializer, this));
  }

  static Config? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Config.serializer, json.decode(jsonString));
  }

  static Serializer<Config> get serializer => _$configSerializer;
}
