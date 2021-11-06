import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_review.dart';
import 'bb_serializers.dart';
import 'bb_watch_progress.dart';

part 'bb_bangumi_user_status.g.dart';

abstract class BangumiUserStatus
    implements Built<BangumiUserStatus, BangumiUserStatusBuilder> {
  // Fields
  int? get follow;

  @BuiltValueField(wireName: "follow_status")
  int? get followStatus;

  @BuiltValueField(wireName: "follow_bubble")
  int? get followBubble;
  
  int? get pay;

  WatchProgress? get progress;

  Review? get review;
  
  int? get sponsor; 
  
  int? get vip;

  @BuiltValueField(wireName: "vip_frozen")
  int? get vipFrozen;

  BangumiUserStatus._();

  factory BangumiUserStatus([void Function(BangumiUserStatusBuilder) updates]) =
      _$BangumiUserStatus;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BangumiUserStatus.serializer, this));
  }

  static BangumiUserStatus? fromJson(String jsonString) {
    return serializers.deserializeWith(
        BangumiUserStatus.serializer, json.decode(jsonString));
  }

  static Serializer<BangumiUserStatus> get serializer =>
      _$bangumiUserStatusSerializer;
}
