import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_live_home_activity.dart';
import 'bb_live_home_ad.dart';
import 'bb_live_tag.dart';
import 'bb_live_group.dart';
import 'bb_room.dart';

export 'bb_live_home_activity.dart';
export 'bb_live_home_ad.dart';
export 'bb_live_tag.dart';
export 'bb_live_group.dart';
export 'bb_room.dart';

part 'bb_live_home_body.g.dart';

abstract class LiveHomeBody
    implements Built<LiveHomeBody, LiveHomeBodyBuilder> {
  // Fields

  @BuiltValueField(wireName: 'hour_rank')
  BuiltList<LiveGroup<Room>>? get hourRank;

  @BuiltValueField(wireName: 'sea_patrol')
  BuiltList<dynamic>? get seaPatrol;

  @BuiltValueField(wireName: 'my_tag')
  BuiltList<dynamic>? get myTag;

  @BuiltValueField(wireName: 'my_idol')
  BuiltList<LiveGroup<Room>>? get myIdol;

  @BuiltValueField(wireName: 'room_list')
  BuiltList<LiveGroup<Room>>? get roomList;

  @BuiltValueField(wireName: 'activity_card')
  BuiltList<dynamic>? get activityCard;
  
  int? get interval;

  @BuiltValueField(wireName: 'area_entrance_v2')
  BuiltList<LiveGroup<LiveTag>>? get areaEntranceV2;

  @BuiltValueField(wireName: 'area_entrance')
  BuiltList<dynamic>? get areaEntrance;

  @BuiltValueField(wireName: 'banner')
  BuiltList<LiveGroup<LiveHomeAd>>? get banner;

  @BuiltValueField(wireName: 'activity_card_v2')
  BuiltList<LiveGroup<LiveHomeActivity>>? get activityCardV2;

  @BuiltValueField(wireName: 'is_sky_horse_gray')
  int? get isSkyHorseGray;

  LiveHomeBody._();

  factory LiveHomeBody([void Function(LiveHomeBodyBuilder) updates]) =
      _$LiveHomeBody;

  String toJson() {
    return json
        .encode(serializers.serializeWith(LiveHomeBody.serializer, this));
  }

  static LiveHomeBody? fromJson(String jsonString) {
    return serializers.deserializeWith(
        LiveHomeBody.serializer, json.decode(jsonString));
  }

  static Serializer<LiveHomeBody> get serializer => _$liveHomeBodySerializer;
}
