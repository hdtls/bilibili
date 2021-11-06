import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_activity.dart';
import 'bb_actor.dart';
import 'bb_area.dart';
import 'bb_bangumi_status.dart';
import 'bb_bangumi_user_status.dart';
import 'bb_copyright.dart';
import 'bb_episode.dart';
import 'bb_new_ep.dart';
import 'bb_paster.dart';
import 'bb_payment.dart';
import 'bb_publish.dart';
import 'bb_rating.dart';
import 'bb_season.dart';
import 'bb_section.dart';
import 'bb_serial.dart';
import 'bb_serializers.dart';
import 'bb_tag.dart';

part 'bb_bangumi.g.dart';

abstract class Bangumi implements Built<Bangumi, BangumiBuilder> {
  // Fields

  Activity? get activity;

  Actor? get actor;

  String? get alias;

  BuiltList<Area>? get areas;

  String? get badge;
  
  @BuiltValueField(wireName: "badge_type")
  int? get badgeType;

  BuiltList<dynamic>? get celebrity;

  String? get cover;
  
  String get detail;

  @BuiltValueField(wireName: "dynamic_subtitle")
  String? get dynamicSubtitle;

  BuiltList<Episode>? get episodes;

  String? get evaluate;

  String? get link;

  @BuiltValueField(wireName: "media_id")
  int? get mediaId;

  int? get mode;
  
  @BuiltValueField(wireName: "new_ep")
  NewEp? get newEp;

  @BuiltValueField(wireName: "origin_name")
  String? get originName;

  Paster? get paster;

  Payment? get payment;

  BuiltList<Episode>? get playlist;

  Publish? get publish;

  Rating? get rating;

  String? get record;

  @BuiltValueField(wireName: "relate_section")
  BuiltList<dynamic>? get relateSection;

  Copyright? get rights;

  @BuiltValueField(wireName: "season_id")
  int? get seasonId;

  @BuiltValueField(wireName: "seaon_title")
  String? get seasonTitle;

  BuiltList<Season>? get seasons;

  BuiltList<Section>? get section;

  Serial? get series;

  @BuiltValueField(wireName: "share_copy")
  String? get shareCopy;

  @BuiltValueField(wireName: "share_url")
  String? get shareUrl;

  @BuiltValueField(wireName: "short_link")
  String? get shortLink;

  @BuiltValueField(wireName: "square_cover")
  String? get squareCover;

  Actor? get staff;

  BangumiStatus? get stat;

  int? get status;

  BuiltList<Tag>? get styles;

  String? get subtitle;
  
  String? get title;

  int? get total; 

  int? get type;

  @BuiltValueField(wireName: "type_name")
  String? get typeName;

  @BuiltValueField(wireName: "user_status")
  BangumiUserStatus? get userStatus;

  Bangumi._();

  factory Bangumi([void Function(BangumiBuilder) updates]) = _$Bangumi;

  String toJson() {
    return json.encode(serializers.serializeWith(Bangumi.serializer, this));
  }

  static Bangumi? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Bangumi.serializer, json.decode(jsonString));
  }

  static Serializer<Bangumi> get serializer => _$bangumiSerializer;
}
