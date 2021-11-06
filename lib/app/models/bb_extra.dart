import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'bb_serializers.dart';
import 'bb_share_info.dart';
import 'bb_whitelist.dart';
import 'bb_card.dart';

export 'bb_share_info.dart';
export 'bb_whitelist.dart';
export 'bb_card.dart';

part 'bb_extra.g.dart';

abstract class Extra implements Built<Extra, ExtraBuilder> {
  // Fields

  @BuiltValueField(wireName: "sales_type")
  int? get salesType;

  @BuiltValueField(wireName: "share_info")
  ShareInfo? get shareInfo;

  @BuiltValueField(wireName: "use_ad_web_v2")
  bool? get useAdWebV2;

  @BuiltValueField(wireName: "show_urls")
  BuiltList<String>? get showUrls;

  @BuiltValueField(wireName: "click_urls")
  BuiltList<String>? get clickUrls;

  @BuiltValueField(wireName: "upzone_entrance_report_id")
  int? get upzoneEntranceReportId;

  @BuiltValueField(wireName: "special_industry")
  bool? get specialIndustry;

  @BuiltValueField(wireName: "appstore_priority")
  int? get appstorePriority;

  @BuiltValueField(wireName: "upzone_entrance_type")
  int? get upzoneEntranceType;

  @BuiltValueField(wireName: "report_time")
  int? get reportTime;

  @BuiltValueField(wireName: "preload_landingpage")
  int? get preloadLandingpage;

  @BuiltValueField(wireName: "open_white_list")
  BuiltList<dynamic>? get openWhitelist;

  @BuiltValueField(wireName: "special_industry_tips")
  String? get specialIndustryTips;

  @BuiltValueField(wireName: "download_whitelist")
  BuiltList<Whitelist>? get downloadWhitelist;

  @BuiltValueField(wireName: "enable_share")
  bool? get enableShare;

  Card? get card;

  Extra._();

  factory Extra([void Function(ExtraBuilder) updates]) = _$Extra;

  String toJson() {
    return json.encode(serializers.serializeWith(Extra.serializer, this));
  }

  static Extra? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Extra.serializer, json.decode(jsonString));
  }

  static Serializer<Extra> get serializer => _$extraSerializer;
}
