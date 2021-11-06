import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'bb_serializers.dart';

part 'bb_tab_bar_item.g.dart';

abstract class TabBarItem implements Built<TabBarItem, TabBarItemBuilder> {
  // Fields
  
  int? get id;

  String? get name;
  
  String? get uri;

  @BuiltValueField(wireName: "tab_id")
  String? get tabId;

  int? get pos;

  @BuiltValueField(wireName: "icon")
  String? get image;

  @BuiltValueField(wireName: "icon_selected")
  String? get selectedImage;

  @BuiltValueField(wireName: "default_selected")
  int? get selected;

  @BuiltValueField(wireName: "extension")
  ExtTabBarItem? get ext;

  TabBarItem._();

  factory TabBarItem([void Function(TabBarItemBuilder) updates]) = _$TabBarItem;

  String toJson() {
    return json.encode(serializers.serializeWith(TabBarItem.serializer, this));
  }

  static TabBarItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TabBarItem.serializer, json.decode(jsonString));
  }

  static Serializer<TabBarItem> get serializer => _$tabBarItemSerializer;
}

abstract class ExtTabBarItem
    implements Built<ExtTabBarItem, ExtTabBarItemBuilder> {
  // Fields

  @BuiltValueField(wireName: "inactive_icon")
  String? get inactiveIcon;

  @BuiltValueField(wireName: "active_icon")
  String? get activeIcon;

  ExtTabBarItem._();

  factory ExtTabBarItem([void Function(ExtTabBarItemBuilder) updates]) =
      _$ExtTabBarItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ExtTabBarItem.serializer, this));
  }

  static ExtTabBarItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ExtTabBarItem.serializer, json.decode(jsonString));
  }

  static Serializer<ExtTabBarItem> get serializer => _$extTabBarItemSerializer;
}
