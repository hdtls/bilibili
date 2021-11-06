import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_live_pendent.dart';
import 'bb_quality_description.dart';
import 'bb_serializers.dart';

export 'bb_live_pendent.dart';
export 'bb_quality_description.dart';

part 'bb_room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {
  // Fields
  int? get rank;

  @BuiltValueField(wireName: 'live_status')
  int? get liveStatus;

  @BuiltValueField(wireName: 'accept_quality')
  BuiltList<int>? get acceptQuality;

  @BuiltValueField(wireName: "official_verify")
  int? get officialVerify;

  @BuiltValueField(wireName: 'area_v2_id')
  int? get areaV2Id;

  @BuiltValueField(wireName: 'area_v2_parent_id')
  int? get areaV2ParentId;

  @BuiltValueField(wireName: 'area_v2_name')
  String? get areaV2Name;

  @BuiltValueField(wireName: 'area_v2_parent_name')
  String? get areaV2ParentName;

  @BuiltValueField(wireName: 'broadcast_type')
  int? get broadcastType;

  String? get cover;

  @BuiltValueField(wireName: 'current_quality')
  int? get currentQuality;
  
  String? get face;

  String? get link;

  int? get online;

  @BuiltValueField(wireName: 'pendent_ru')
  String? get pendentRu;

  @BuiltValueField(wireName: 'pendent_ru_color')
  String? get pendentRuColor;

  @BuiltValueField(wireName: 'pendent_ru_pic')
  String? get pendentRuPic;

  @BuiltValueField(wireName: 'pk_id')
  int? get pkId;

  @BuiltValueField(wireName: 'play_url')
  String? get playUrl;

  @BuiltValueField(wireName: 'rec_type')
  int? get recType;

  int? get roomid;

  String? get title;
  
  String? get uname;

  @BuiltValueField(wireName: 'play_url_h265')
  String? get playUrlH265;

  @BuiltValueField(wireName: 'session_id')
  String? get sessionId;

  @BuiltValueField(wireName: 'group_id')
  int? get groupId;

  @BuiltValueField(wireName: 'show_callback')
  String? get showCallback;

  @BuiltValueField(wireName: 'click_callback')
  String? get clickCallback;

  @BuiltValueField(wireName: 'current_qn')
  int? get currentQn;

  @BuiltValueField(wireName: 'quality_description')
  BuiltList<QualityDescription>? get qualityDescription;

  @BuiltValueField(wireName: 'play_url_card')
  String? get playUrlCard;
  
  int? get uid;  
  
  int? get flag;

  @BuiltValueField(wireName: 'pendent_list')
  BuiltList<LivePendent>? get pendentList;

  Room._();

  factory Room([void Function(RoomBuilder) updates]) = _$Room;

  String toJson() {
    return json.encode(serializers.serializeWith(Room.serializer, this));
  }

  static Room? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Room.serializer, json.decode(jsonString));
  }

  static Serializer<Room> get serializer => _$roomSerializer;
}
