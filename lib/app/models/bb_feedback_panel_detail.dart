import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_secondary_panel.dart';
import 'bb_serializers.dart';

export 'bb_secondary_panel.dart';

part 'bb_feedback_panel_detail.g.dart';

abstract class FeedbackPanelDetail
    implements Built<FeedbackPanelDetail, FeedbackPanelDetailBuilder> {
  // Fields
  String? get text;

  @BuiltValueField(wireName: "module_id")
  int? get moduleId;

  @BuiltValueField(wireName: "jump_type")
  int? get jumpType;

  @BuiltValueField(wireName: "icon_url")
  String? get iconUrl;

  @BuiltValueField(wireName: "jump_url")
  String? get jumpUrl;

  @BuiltValueField(wireName: "secondary_panel")
  List<SecondaryPanel>? get secondaryPanel;

  FeedbackPanelDetail._();

  factory FeedbackPanelDetail(
          [void Function(FeedbackPanelDetailBuilder) updates]) =
      _$FeedbackPanelDetail;

  String toJson() {
    return json.encode(
        serializers.serializeWith(FeedbackPanelDetail.serializer, this));
  }

  static FeedbackPanelDetail? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FeedbackPanelDetail.serializer, json.decode(jsonString));
  }

  static Serializer<FeedbackPanelDetail> get serializer =>
      _$feedbackPanelDetailSerializer;
}
