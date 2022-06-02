import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_bangumi_follow.dart';
import 'bb_bangumi_status.dart';
import 'bb_bangumi_user_status.dart';
import 'bb_report.dart';
import 'bb_source_content.dart';
import 'bb_trailer.dart';
import 'bb_watch_progress.dart';

export 'bb_bangumi_follow.dart';
export 'bb_bangumi_status.dart';
export 'bb_bangumi_user_status.dart';
export 'bb_report.dart';
export 'bb_source_content.dart';
export 'bb_trailer.dart';
export 'bb_watch_progress.dart';

part 'bb_bangumi_list_item.g.dart';

abstract class BangumiListItem
    implements Built<BangumiListItem, BangumiListItemBuilder> {
  // Fields
  String? get cover;

  @BuiltValueField(wireName: "is_preview")
  int? get isPreview;

  @BuiltValueField(wireName: "item_id")
  int? get itemId;

  String? get link;

  Report? get report;

  @BuiltValueField(wireName: "source_content")
  SourceContent? get sourceContent;
  
  String? get title;
  
  int? get wid;
  
  String? get badge;

  @BuiltValueField(wireName: "badge_type")
  int? get badgeType;
  
  String? get desc;

  @BuiltValueField(wireName: "desc_type")
  int? get descType;

  BangumiFollow? get follow;

  WatchProgress? get progress;

  @BuiltValueField(wireName: "season_id")
  int? get seasonId;

  @BuiltValueField(wireName: "season_type")
  int? get seasonType;
  
  String? get desc2;

  @BuiltValueField(wireName: "can_watch")
  int? get canWatch;

  @BuiltValueField(wireName: "is_auto")
  int? get isAuto;
  
  int? get oid;

  BangumiStatus? get stat;

  BangumiUserStatus? get status;
  
  String? get type;
  
  String? get date;

  @BuiltValueField(wireName: "date_ts")
  int? get dateTs;

  @BuiltValueField(wireName: "day_of_week")
  int? get dayOfWeek;

  BuiltList<Trailer>? get episodes;

  @BuiltValueField(wireName: "is_today")
  int? get isToday;

  BuiltList<BangumiListItem>? get cards;
  
  String? get pts;

  @BuiltValueField(wireName: "is_new")
  int? get isNew;
  
  String? get cursor;
  
  String? get hat;

  BangumiListItem._();

  factory BangumiListItem([void Function(BangumiListItemBuilder) updates]) =
      _$BangumiListItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BangumiListItem.serializer, this));
  }

  static BangumiListItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BangumiListItem.serializer, json.decode(jsonString));
  }

  static Serializer<BangumiListItem> get serializer =>
      _$bangumiListItemSerializer;
}
