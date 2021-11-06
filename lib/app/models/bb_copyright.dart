import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_copyright.g.dart';

abstract class Copyright implements Built<Copyright, CopyrightBuilder> {
  // Fields

  @BuiltValueField(wireName: "allow_bp")
  int? get allowBp;

  @BuiltValueField(wireName: "allow_bp_rank")
  int? get allowBpRank;

  @BuiltValueField(wireName: "allow_download")
  int? get allowDownload;

  @BuiltValueField(wireName: "allow_dm")
  int? get allowDm;

  @BuiltValueField(wireName: "allow_review")
  int? get allowReview;

  @BuiltValueField(wireName: "area_limit")
  int? get areaLimit;

  @BuiltValueField(wireName: "ban_area_show")
  int? get banAreaShow;

  @BuiltValueField(wireName: "can_watch")
  int? get canWatch;

  String? get copyright;

  @BuiltValueField(wireName: "copyright_name")
  String? get copyrightName;

  @BuiltValueField(wireName: "forbid_pre")
  int? get forbidPre;

  @BuiltValueField(wireName: "is_cover_show")
  int? get isCoverShow;

  @BuiltValueField(wireName: "is_preview")
  int? get isPreview;

  String? get resource;

  @BuiltValueField(wireName: "watch_platform")
  int? get watchPlatform;

  Copyright._();

  factory Copyright([void Function(CopyrightBuilder) updates]) = _$Copyright;

  String toJson() {
    return json.encode(serializers.serializeWith(Copyright.serializer, this));
  }

  static Copyright? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Copyright.serializer, json.decode(jsonString));
  }

  static Serializer<Copyright> get serializer => _$copyrightSerializer;
}
