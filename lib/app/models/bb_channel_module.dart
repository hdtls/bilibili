import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_channel_group.dart';

export 'bb_button_description.dart';
export 'bb_channel.dart';

part 'bb_channel_module.g.dart';

abstract class ChannelModule
    implements Built<ChannelModule, ChannelModuleBuilder> {
  // Fields
  String? get offset;

  @BuiltValueField(wireName: "items")
  BuiltList<Channel>? get items;

  @BuiltValueField(wireName: "items")
  ChannelGroup? get item;

  @BuiltValueField(wireName: "model_type")
  String? get type;

  @BuiltValueField(wireName: "model_title")
  String? get title;

  String? get label;

  @BuiltValueField(wireName: "has_more")
  int? get hasMore;

  @BuiltValueField(wireName: "desc_button")
  ButtonDescription? get descButton;

  ChannelModule._();

  factory ChannelModule([void Function(ChannelModuleBuilder) updates]) =
      _$ChannelModule;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ChannelModule.serializer, this));
  }

  static ChannelModule? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChannelModule.serializer, json.decode(jsonString));
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<ChannelModule> get serializer => _$channelModuleSerializer;
}

Serializer<ChannelModule> _$channelModuleSerializer =
    _$ChannelModuleSerializer();

class _$ChannelModuleSerializer implements StructuredSerializer<ChannelModule> {
  @override
  final Iterable<Type> types = const [ChannelModule, _$ChannelModule];
  @override
  final String wireName = 'ChannelModule';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChannelModule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.offset != null) {
      result
        ..add('offset')
        ..add(serializers.serialize(object.offset,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('model_type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('model_title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.label != null) {
      result
        ..add('label')
        ..add(serializers.serialize(object.label,
            specifiedType: const FullType(String)));
    }
    if (object.hasMore != null) {
      result
        ..add('has_more')
        ..add(serializers.serialize(object.hasMore,
            specifiedType: const FullType(int)));
    }
    if (object.descButton != null) {
      result
        ..add('desc_button')
        ..add(serializers.serialize(object.descButton,
            specifiedType: const FullType(ButtonDescription)));
    }
    if (object.item != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.item,
            specifiedType: const FullType(ChannelGroup)));
    }
    if (object.items != null) {
      result
        ..add('items')
        ..add(serializers.serialize(object.items,
            specifiedType: const FullType(BuiltList, [FullType(Channel)])));
    }
    return result;
  }

  @override
  ChannelModule deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ChannelModuleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'items':
          if (value is List<dynamic>) {
            result.items.replace(serializers.deserialize(value,
                    specifiedType:
                        const FullType(BuiltList, [FullType(Channel)]))
                as BuiltList<Object>);
          } else if (value is Map<String, dynamic>) {
            result.item.replace(serializers.deserialize(value,
                specifiedType: const FullType(ChannelGroup)) as ChannelGroup);
          }
          break;
        case 'model_type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'model_title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'has_more':
          result.hasMore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'desc_button':
          result.descButton.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ButtonDescription))
              as ButtonDescription);
          break;
      }
    }

    return result.build();
  }
}
