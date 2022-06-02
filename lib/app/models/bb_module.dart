import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_attr.dart';
import 'bb_bangumi_list_item.dart';
import 'bb_module_follow.dart';
import 'bb_module_style.dart';
import 'bb_region.dart';

export 'bb_attr.dart';
export 'bb_bangumi_list_item.dart';
export 'bb_module_follow.dart';
export 'bb_region.dart';
export 'bb_report.dart';

part 'bb_module.g.dart';

abstract class Module<Element>
    implements Built<Module<Element>, ModuleBuilder<Element>> {
  // Fields

  Attr? get attr;

  BuiltList<Region>? get headers;

  BuiltList<Element>? get items;

  @BuiltValueField(wireName: "module_id")
  int? get moduleId;

  Report? get report;

  int? get size;
  
  ModuleStyle? get style;

  String? get title;

  String? get subtitle;

  String? get url;

  int? get type;

  BuiltList<int>? get wid;

  ModuleFollow? get follow;

  Module._();

  factory Module([void Function(ModuleBuilder<Element>) updates]) =
      _$Module<Element>;

  String toJson() {
    return json.encode(serializers.serialize(this,
        specifiedType: FullType(Module, [FullType(Element)])));
  }

  static Module<Element>? fromJson<Element>(String jsonString) {
    return serializers.deserialize(
      json.decode(jsonString),
      specifiedType: FullType(Module, [FullType(Element)]),
    ) as Module<Element>?;
  }

  static Serializer<Module> get serializer => _$moduleSerializer;
}
