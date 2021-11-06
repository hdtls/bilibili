import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_report.g.dart';

abstract class Report implements Built<Report, ReportBuilder> {
  // Fields

  @BuiltValueField(wireName: "card_type")
  String? get cardType;

  @BuiltValueField(wireName: "item_id")
  String? get itemId;

  @BuiltValueField(wireName: "module_id")
  String? get moduleId;

  @BuiltValueField(wireName: "module_type")
  String? get moduleType;

  String? get oid;

  @BuiltValueField(wireName: "season_type")
  String? get seasonType;

  Report._();

  factory Report([void Function(ReportBuilder) updates]) = _$Report;

  String toJson() {
    return json.encode(serializers.serializeWith(Report.serializer, this));
  }

  static Report? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Report.serializer, json.decode(jsonString));
  }

  static Serializer<Report> get serializer => _$reportSerializer;
}
