import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_episode.dart';
import 'bb_serializers.dart';

part 'bb_section.g.dart';

abstract class Section implements Built<Section, SectionBuilder> {
  // Fields

  @BuiltValueField(wireName: "episode_id")
  String? get episodeId;

  BuiltList<Episode>? get episodes;

  int? get id;

  String? get more;

  String? get title;
  
  int? get type;

  Section._();

  factory Section([void Function(SectionBuilder) updates]) = _$Section;

  String toJson() {
    return json.encode(serializers.serializeWith(Section.serializer, this));
  }

  static Section? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Section.serializer, json.decode(jsonString));
  }

  static Serializer<Section> get serializer => _$sectionSerializer;
}
