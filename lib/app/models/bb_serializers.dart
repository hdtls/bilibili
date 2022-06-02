library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'bb_badge.dart';
import 'bb_bangumi_home_body.dart';
import 'bb_channel_group.dart';
import 'bb_channel_module.dart';
import 'bb_copyright.dart';
import 'bb_dimension.dart';
import 'bb_episode.dart';
import 'bb_featured_body.dart';
import 'bb_http_body.dart';
import 'bb_live_home_body.dart';
import 'bb_module_style.dart';
import 'bb_partation.dart';
import 'bb_mine.dart';
import 'bb_review.dart';
import 'bb_service.dart';
import 'bb_tab_bar_http_body.dart';

part 'bb_serializers.g.dart';

@SerializersFor([
  AdTagStyle,
  Advertisement,
  AdvertisementCreativeContent,
  Argument,
  Attr,
  Badge,
  BangumiFollow,
  BangumiHomeBody,
  BangumiHomeBodyPopular,
  BangumiListItem,
  BangumiStatus,
  BangumiUserStatus,
  ButtonDescription,
  Card,
  Channel,
  ChannelModule,
  ChannelGroup,
  Config,
  Copyright,
  Cover,
  Dimension,
  Episode,
  Extra,
  FeaturedBody,
  FeedbackPanel,
  FeedbackPanelDetail,
  HttpBody,
  HttpListBody,
  LiveExtra,
  LiveGroup,
  LiveHomeActivity,
  LiveHomeAd,
  LiveHomeBody,
  LiveModule,
  LivePendent,
  LiveTag,
  Media,
  Mine,
  Module,
  ModuleFollow,
  ModuleStyle,
  NewEp,
  OfficialVerify,
  Partation,
  Pendant,
  QualityDescription,
  Reason,
  Region,
  Report,
  Review,
  Room,
  SecondaryPanel,
  Service,
  ShareInfo,
  SourceContent,
  TabBarConfig,
  TabBarDisplay,
  TabBarHttpBody,
  TabBarItem,
  TextAttributes,
  ThreePoint,
  ThreePointV2,
  Trailer,
  Vip,
  VipLabel,
  WatchProgress,
  Whitelist,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        FullType(HttpListBody, [FullType(Partation)]),
        () => HttpListBodyBuilder<Partation>(),
      )
      ..addBuilderFactory(
        FullType(HttpListBody, [FullType(ChannelModule)]),
        () => HttpListBodyBuilder<ChannelModule>(),
      )
      ..addBuilderFactory(
        FullType(HttpBody, [FullType(Mine)]),
        () => HttpBodyBuilder<Mine>(),
      )
      ..addBuilderFactory(
        FullType(HttpBody, [FullType(BangumiHomeBody)]),
        () => HttpBodyBuilder<BangumiHomeBody>(),
      )
      ..addBuilderFactory(
        FullType(HttpBody, [FullType(FeaturedBody)]),
        () => HttpBodyBuilder<FeaturedBody>(),
      )
      ..addBuilderFactory(
        FullType(HttpBody, [FullType(LiveHomeBody)]),
        () => HttpBodyBuilder<LiveHomeBody>(),
      )
      ..addBuilderFactory(
        FullType(Module, [FullType(BangumiListItem)]),
        () => ModuleBuilder<BangumiListItem>(),
      )
      ..addBuilderFactory(
        FullType(Module, [FullType(Service)]),
        () => ModuleBuilder<Service>(),
      )
      ..addBuilderFactory(
        FullType(LiveGroup, [FullType(Room)]),
        () => LiveGroupBuilder<Room>(),
      )
      ..addBuilderFactory(
        FullType(LiveGroup, [FullType(LiveTag)]),
        () => LiveGroupBuilder<LiveTag>(),
      )
      ..addBuilderFactory(
        FullType(LiveGroup, [FullType(LiveHomeAd)]),
        () => LiveGroupBuilder<LiveHomeAd>(),
      )
      ..addBuilderFactory(
        FullType(LiveGroup, [FullType(LiveHomeActivity)]),
        () => LiveGroupBuilder<LiveHomeActivity>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(LiveGroup)]),
        () => ListBuilder<LiveGroup>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(Room)]),
        () => ListBuilder<Room>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(LiveTag)]),
        () => ListBuilder<LiveTag>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(LiveHomeAd)]),
        () => ListBuilder<LiveHomeAd>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(LiveHomeActivity)]),
        () => ListBuilder<LiveHomeActivity>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(ChannelModule)]),
        () => ListBuilder<ChannelModule>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(Partation)]),
        () => ListBuilder<Partation>(),
      )
      ..addBuilderFactory(
        FullType(BuiltList, [FullType(Service)]),
        () => ListBuilder<Service>(),
      )
      ..addPlugin(StandardJsonPlugin()))
    .build();
