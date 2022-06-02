import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_module.dart';
import 'bb_official_verify.dart';
import 'bb_service.dart';
import 'bb_vip.dart';
import 'bb_pendent.dart';

export 'bb_official_verify.dart';
export 'bb_vip.dart';
export 'bb_pendent.dart';

part 'bb_mine.g.dart';

abstract class Mine implements Built<Mine, MineBuilder> {
  // Fields
  int? get rank; 

  int? get follower;

  @BuiltValueField(wireName: "official_verify")
  OfficialVerify? get officialVerify;

  Pendant? get pendant;
    
  int? get bcoin;
  
  int? get mid;

  int? get silence;

  @BuiltValueField(wireName: "vip_type")
  int? get vipType;

  @BuiltValueField(wireName: "new_followers")
  int? get newFollowers;

  int? get sex;

  @BuiltValueField(wireName: "vip_section_v2")
  Module<Service>? get vipSectionV2;

  BuiltList<Module<Service>>? get sections;

  @BuiltValueField(wireName: "show_videoup")
  int? get showVideoup;

  String? get name;
  
  @BuiltValueField(wireName: "show_creative")
  int? get showCreative;

  @BuiltValueField(wireName: "dynamic")
  int? get dynamics;

  @BuiltValueField(wireName: "vip_section")
  Module<Service>? get vipSection;

  int? get level;

  double? get coin;

  @BuiltValueField(wireName: "audio_type")
  int? get audioType;

  int? get following;
  
  String? get face;

  Vip? get vip;

  Mine._();

  factory Mine([void Function(MineBuilder) updates]) = _$Mine;

  String toJson() {
    return json.encode(serializers.serializeWith(Mine.serializer, this));
  }

  static Mine? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Mine.serializer, json.decode(jsonString));
  }

  static Serializer<Mine> get serializer => _$mineSerializer;
}
