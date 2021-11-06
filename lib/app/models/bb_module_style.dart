import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bb_module_style.g.dart';

class ModuleStyle extends EnumClass {
  @BuiltValueEnumConst(wireName: "banner")
  static const ModuleStyle banner = _$BANNER;
  @BuiltValueEnumConst(wireName: "function")
  static const ModuleStyle function = _$FUNCTION;
  @BuiltValueEnumConst(wireName: "follow")
  static const ModuleStyle follow = _$FOLLOW;
  @BuiltValueEnumConst(wireName: "tip")
  static const ModuleStyle tip = _$TIP;
  @BuiltValueEnumConst(wireName: "card")
  static const ModuleStyle card = _$CARD;
  @BuiltValueEnumConst(wireName: "v_card")
  static const ModuleStyle vcard = _$VCARD;
  @BuiltValueEnumConst(wireName: "timeline")
  static const ModuleStyle timeline = _$TIMELINE;
  @BuiltValueEnumConst(wireName: "rank")
  static const ModuleStyle rank = _$RANK;
  @BuiltValueEnumConst(wireName: "flow")
  static const ModuleStyle flow = _$FLOW;
  @BuiltValueEnumConst(wireName: "topic")
  static const ModuleStyle topic = _$TOPIC;
  @BuiltValueEnumConst(wireName: "list")
  static const ModuleStyle list = _$LIST;
  @BuiltValueEnumConst(wireName: "h_list")
  static const ModuleStyle hlist = _$HLIST;

  const ModuleStyle._(String name) : super(name);

  static BuiltSet<ModuleStyle> get values => _$values;
  static ModuleStyle valueOf(String name) => _$valueOf(name);

  @BuiltValueSerializer(custom: true)
  static Serializer<ModuleStyle> get serializer => _$moduleStyleSerializer;
}

Serializer<ModuleStyle> _$moduleStyleSerializer = _$ModuleStyleSerializer();

class _$ModuleStyleSerializer implements PrimitiveSerializer<ModuleStyle> {
  static const Map<String, String> _toWire = <String, String>{
    'banner': 'banner',
    'function': 'function',
    'follow': 'follow',
    'tip': 'tip',
    'card': 'card',
    'vcard': 'v_card',
    'timeline': 'timeline',
    'rank': 'rank',
    'flow': 'flow',
    'topic': 'topic',
    'list' : 'list',
    'hlist': 'h_list',
  };
  static const Map<String, String> _fromWire = <String, String>{
    'banner': 'banner',
    'function': 'function',
    'follow': 'follow',
    'tip': 'tip',
    'card': 'card',
    'v_card': 'vcard',
    'timeline': 'timeline',
    'rank': 'rank',
    'flow': 'flow',
    'topic': 'topic',
    'list' : 'list',
    'h_list': 'hlist',
  };

  @override
  final Iterable<Type> types = const <Type>[ModuleStyle];
  @override
  final String wireName = 'ModuleStyle';

  @override
  Object serialize(Serializers serializers, ModuleStyle object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ModuleStyle deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    try {
      return ModuleStyle.valueOf(_fromWire[serialized] ?? serialized as String);
    } catch (e) {
      return ModuleStyle._(_fromWire[serialized] ?? serialized as String);
    }
  }
}
