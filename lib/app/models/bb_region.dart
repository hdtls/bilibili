import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_report.dart';
import 'bb_serializers.dart';

export 'bb_report.dart';

part 'bb_region.g.dart';

abstract class Region implements Built<Region, RegionBuilder> {
  // Fields
  
  String? get icon;
  
  int? get isExpand;
  
  String? get title;
  
  String? get url;

  Report? get report;

  Region._();

  factory Region([void Function(RegionBuilder) updates]) = _$Region;

  String toJson() {
    return json.encode(serializers.serializeWith(Region.serializer, this));
  }

  static Region? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Region.serializer, json.decode(jsonString));
  }

  static Serializer<Region> get serializer => _$regionSerializer;
}
