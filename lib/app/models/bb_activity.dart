import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';
import 'bb_threshold.dart';

part 'bb_activity.g.dart';

abstract class Activity implements Built<Activity, ActivityBuilder> {
  // Fields
  String? get cover;
  int get id;
  String? get link;
  BuiltList<Threshold>? get threshold;
  String? get title;
  int? get type;

  Activity._();

  factory Activity([void Function(ActivityBuilder) updates]) = _$Activity;

  String toJson() {
    return json.encode(serializers.serializeWith(Activity.serializer, this));
  }

  static Activity? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Activity.serializer, json.decode(jsonString));
  }

  static Serializer<Activity> get serializer => _$activitySerializer;
}
