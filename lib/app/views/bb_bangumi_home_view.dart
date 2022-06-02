import 'dart:async';
import 'dart:collection';
import 'package:bilibili/app/blocs/bb_bangumi_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';
import '../models/bb_models.dart';
import 'bb_bangumi_card_view.dart';
import 'bb_bangumi_rank_row.dart';

class BBBangumiHomeView extends StatefulWidget {
  final String path;
  const BBBangumiHomeView({Key? key, required this.path}): super(key: key);

  @override
  _BBBangumiHomeViewState createState() => _BBBangumiHomeViewState();
}

class _BBBangumiHomeViewState extends State<BBBangumiHomeView>
    with AutomaticKeepAliveClientMixin {
  late RefreshController _refreshController;
  final StreamController<BangumiListItem> _timeline = StreamController.broadcast();
  late ScrollController _scrollController;
  late BBBangumiHomeBLoC _bLoC;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _scrollController = ScrollController();
    _bLoC = BBBangumiHomeBLoC()..add(BangumiHomePaginationLoadEvent(path: widget.path));
  }

  @override
  void dispose() {
    super.dispose();
    _timeline.close();
    _refreshController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder(
      bloc: _bLoC,
      builder: (BuildContext context, BangumiHomeState state) {
        Widget subview;
        if (state is BangumiHomeLoading) {
          subview = BBLoadingView();
        } else if (state is BangumiHomeLoadSuccess<List<Module<BangumiListItem>>>) {
          _refreshController.refreshCompleted();
          subview =
              SmartRefresher(
                controller: _refreshController,
                onRefresh: () => _bLoC.add(BangumiHomePaginationLoadEvent(path: widget.path)),
                child: CustomScrollView(
                  slivers: _buildSlivers(state.value),
                ),
              );
        } else {
          _refreshController.refreshCompleted();
          subview = Container();
        }
        return SafeArea(bottom: false, child: subview);
      },
    );
  }

  List<Widget> _buildSlivers(List<Module<BangumiListItem>> modules) {
    List<Module<BangumiListItem>> modulesCopy =
        modules.where((e) => e.items?.isNotEmpty ?? false).toList();

    int index = modulesCopy.indexWhere((e) => e.style == ModuleStyle.tip);
    if (index != -1) {
      modulesCopy.insert(0, modulesCopy.removeAt(index));
    }
    index = modulesCopy.indexWhere((e) => e.style == ModuleStyle.function);
    if (index != -1) {
      modulesCopy.insert(0, modulesCopy.removeAt(index));
    }
    index = modulesCopy.indexWhere((e) => e.style == ModuleStyle.banner);
    if (index != -1) {
      modulesCopy.insert(0, modulesCopy.removeAt(index));
    }

    return modulesCopy
        .map((module) {
          switch (module.style) {
            case ModuleStyle.banner:
              return _bannerSlivers(module);
            case ModuleStyle.function:
              return _featuresSlivers(module);
            case ModuleStyle.follow:
              return _followSlivers(module);
            case ModuleStyle.tip:
              return _tipSlivers(module);
            case ModuleStyle.vcard:
            case ModuleStyle.card:
              return _cardSlivers(module);
            case ModuleStyle.topic:
              return _topicSlivers(module);
            case ModuleStyle.timeline:
              return _timelineSlivers(module);
            case ModuleStyle.rank:
              return _rankSlivers(module);
            case ModuleStyle.flow:
              return _flowSlivers(module);
            case ModuleStyle.list:
              return _listSlivers(module);
            case ModuleStyle.hlist:
              return _horizontalListSlivers(module);
            default:
              return <Widget>[];
          }
        })
        .expand((slivers) => slivers)
        .toList();
  }

  List<Widget> _tipSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFCFCF0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: defaultMargin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      module.items?.first.title ?? "",
                      style: TextStyle(color: Color(0xFFF7B776)),
                    ),
                    SizedBox(height: defaultMargin.bottom / 2),
                    Text(
                      module.items?.first.desc ?? "",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFCF0DE),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 2.0),
                        child: Center(
                          child: Text(
                            module.items?.first.desc2 ?? "",
                            style: TextStyle(
                              color: Color(0xFFF7B776),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Image.asset(Images.vipTipClose),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _timelineSlivers(Module<BangumiListItem> module) {
    BangumiListItem? initialData =
        module.items?.firstWhere((e) => e.isToday == 1) ??
            module.items?.first;

    return [
      sliverToBoxAdapter(
        padding: EdgeInsets.only(top: defaultMargin.top),
        child: StreamBuilder(
          initialData: initialData,
          stream: _timeline.stream,
          builder:
              (BuildContext context, AsyncSnapshot<BangumiListItem> snapshot) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                LinkedHashMap hashMap = LinkedHashMap.from(
                  {"五": 5, "六": 6, "日": 7, "一": 1, "二": 2, "三": 3, "四": 4},
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: hashMap.keys.map((d) {
                    bool isSelected = snapshot.data ==
                        module.items?.firstWhere(
                            (e) => e.dayOfWeek == hashMap[d]);
                    return GestureDetector(
                      child: Container(
                        height: 28.0,
                        width:
                            (constraints.maxWidth - defaultMargin.left * 8) / 7,
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFFF6749A) : null,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Center(
                          child: Text(
                            isSelected ? "周$d" : d,
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                      onTap: () {
                        BangumiListItem selected = module.items!.firstWhere(
                            (e) => e.dayOfWeek == hashMap[d]);
                        _timeline.sink.add(selected);
                      },
                    );
                  }).toList(),
                );
              },
            );
          },
        ),
      ),
      StreamBuilder(
        initialData: initialData,
        builder:
            (BuildContext context, AsyncSnapshot<BangumiListItem> snapshot) {
          return sliverGrid(
            padding: defaultMargin,
            items: snapshot.data?.episodes?.toList(),
            crossAxisCount: 4,
            aspectRatio: 9.0 / 16.0,
            itemBuilder: (BuildContext context, Trailer bangumi) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: BBNetworkImage(
                        bangumi.squareCover,
                        placeholder: Images.placeholder,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(bangumi.title ?? "", maxLines: 2),
                  Text(
                    "更新至${bangumi.pubIndex ?? "-"}",
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                  ),
                ],
              );
            },
          );
        },
        stream: _timeline.stream,
      ),
      sliverToBoxAdapter(
          child: Padding(
        padding: defaultMargin,
        child: Row(children: <Widget>[
          Spacer(),
          Text(
            "查看完整时间表",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Color(0xFFF6749A),
                ),
          ),
          Image.asset(Images.rightArrow, color: Color(0xFFF6749A)),
          Spacer(),
        ]),
      )),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _rankSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: BBHeadView(title: module.title),
      ),
      sliverToBoxAdapter(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxWidth - 50.0,
            child: NotificationListener(
              onNotification: (note) {
                return true;
              },
              child: GridView.builder(
                controller: ScrollController(),
                padding: defaultMargin.copyWith(top: 0.0, bottom: 0.0),
                scrollDirection: Axis.horizontal,
                itemCount: module.items?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: defaultMargin.left,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.03),
                          Colors.transparent
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              defaultMargin.copyWith(top: 16.0, bottom: 0.0),
                          child: Text(module.items![index].title ?? ""),
                        ),
                        Expanded(
                          child: Padding(
                            padding: defaultMargin.copyWith(bottom: 0.0),
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return ListView.builder(
                                itemCount:
                                    module.items![index].cards?.length ?? 0,
                                itemExtent: constraints.maxHeight / 3,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  BangumiListItem bangumi =
                                      module.items![index].cards![index];
                                  return BBBangumiRankRow(bangumi, index);
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      )),
      sliverToBoxAdapter(
          child: Padding(
        padding: defaultMargin,
        child: Row(children: <Widget>[
          Spacer(),
          Text(
            "查看完整榜单",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Color(0xFFF6749A),
                ),
          ),
          Image.asset(Images.rightArrow, color: Color(0xFFF6749A)),
          Spacer(),
        ]),
      )),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _cardSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: BBHeadView(title: module.title),
      ),
      sliverGrid(
        padding: defaultMargin.copyWith(top: 0.0),
        aspectRatio: module.style == ModuleStyle.card ? 1.25 : 0.53,
        items: module.items?.toList(),
        crossAxisCount: module.style == ModuleStyle.card ? 2 : 3,
        itemBuilder: (BuildContext context, BangumiListItem bangumi) {
          return BBBangumiCardView(
            bangumi,
            aspectRatio:
                module.style == ModuleStyle.card ? 16.0 / 9.0 : 3.0 / 4.0,
          );
        },
      ),
      sliverToBoxAdapter(child: BBExchangeView()),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _bannerSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin.copyWith(top: 0.0, bottom: 0.0),
        child: BBAdView(
          aspectRatio: 375 / 150,
          borderRadius: BorderRadius.circular(5.0),
          advertise: module.items?.toList(),
          itemBuilder: (BuildContext context, int index) {
            return BBNetworkImage(
              module.items?.toList()[index].cover,
              placeholder: Images.placeholder,
            );
          },
        ),
      ),
    ];
  }

  List<Widget> _featuresSlivers(Module<BangumiListItem> module) {
    return [
      sliverGrid(
        padding: defaultMargin.copyWith(left: 0.0, right: 0.0),
        items: module.items?.toList(),
        crossAxisCount: 5,
        itemBuilder: (BuildContext context, BangumiListItem features) {
          return BBAppView(
            title: features.title,
            image: features.cover,
            spacing: 0.0,
          );
        },
      ),
    ];
  }

  List<Widget> _followSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: BBHeadView(
          title: module.title,
          accessoryView: Row(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: "更新",
                  style: TextStyle(fontSize: 12.0),
                  children: <InlineSpan>[
                    TextSpan(
                      text: " ${module.follow?.upgrade ?? "-"} ",
                      style: TextStyle(
                        color: Color(0xFFF6749A),
                      ),
                    ),
                    TextSpan(
                      text: "部",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: SizedBox(
          height: 120.0,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: defaultMargin.left,
            ),
            itemBuilder: (BuildContext context, int index) {
              return BBBangumiCardView(module.items![index]);
            },
            itemCount: module.items?.length,
          ),
        ),
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _topicSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin.copyWith(bottom: 0.0),
        child: BBHeadView(title: module.title),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: defaultMargin,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: BBNetworkImage(
                      module.items![index].cover,
                      placeholder: Images.placeholder,
                      aspectRatio: 375.0 / 105.0,
                    ),
                  ),
                ),
                Padding(
                  padding: defaultMargin.copyWith(top: 0.0),
                  child: Text(module.items?[index].title ?? ""),
                ),
                index != module.items!.length - 1
                    ? Divider()
                    : SizedBox.shrink(),
              ],
            );
          },
          childCount: module.items?.length,
        ),
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _listSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin.copyWith(bottom: 0.0),
        child: BBHeadView(
          title: module.title,
          accessory: null,
          image: null,
        ),
      ),
      sliverGrid(
        padding: defaultMargin.copyWith(top: 0.0, bottom: 0.0, right: 0.0),
        items: module.items?.toList(),
        crossAxisCount: 1,
        aspectRatio: 375.0 / 80.0,
        lineSpacing: 0.0,
        itemBuilder: (BuildContext context, BangumiListItem bangumi) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: defaultMargin.copyWith(
                      left: 0.0, right: defaultMargin.right),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: BBNetworkImage(
                          bangumi.cover,
                          placeholder: Images.placeholder,
                          aspectRatio: 16.0 / 9.0,
                        ),
                      ),
                      SizedBox(width: defaultMargin.left),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(bangumi.title ?? ""),
                            Text(
                              bangumi.desc ?? "",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _horizontalListSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: BBHeadView(
          title: module.title,
          accessory: null,
          image: null,
        ),
      ),
      sliverToBoxAdapter(
        child: SizedBox(
          height: 235.0,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: defaultMargin.left / 2,
              right: defaultMargin.right / 2,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              BangumiListItem bangumi = module.items![index];
              return Column(
                children: <Widget>[
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          left: index == 0 ? constraints.maxWidth / 2 : 0,
                          top: 9,
                          right: index == module.items!.length - 1
                              ? constraints.maxWidth / 2
                              : 0,
                          height: 2.0,
                          child: Container(
                            color: Color(0xFFDEF3F9),
                            width: constraints.maxWidth / 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 20.0,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFDEF3F9),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  bangumi.hat ?? "",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 2.0),
                  Padding(
                    padding: EdgeInsets.only(
                      left: defaultMargin.left / 2,
                      right: defaultMargin.right / 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 3.0 / 4.0,
                          child: BBThumbnailView(
                            url: bangumi.cover,
                            borderRadius: BorderRadius.circular(5.0),
                            topRightView: Padding(
                              padding: EdgeInsets.only(top: 2.0, right: 2.0),
                              child: BBMediaTagView(
                                contentInsets:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                textAttributes: TextAttributes(
                                  (u) => u
                                    ..text = bangumi.badge
                                    ..textColor = "#FFFFFF"
                                    ..backgroundColor = "#F6749A",
                                ),
                              ),
                            ),
                            bottomLeftIconAndDescriptions: [
                              ThumbnailImageLabel(label: bangumi.follow?.newEp?.indexShow ??
                                      bangumi.stat?.followView)
                            ],
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          bangumi.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: defaultMargin.bottom),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin.left),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF6749A)),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset(Images.thumbnailFollow,
                                color: Color(0xFFF6749A)),
                            SizedBox(width: defaultMargin.left),
                            Text(
                              "追剧",
                              style: TextStyle(color: Color(0xFFF6749A)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: module.items?.length,
            itemExtent: 120.0,
          ),
        ),
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }

  List<Widget> _flowSlivers(Module<BangumiListItem> module) {
    return [
      sliverToBoxAdapter(
        padding: defaultMargin,
        child: BBHeadView(
          title: module.title,
        ),
      ),
      sliverToBoxAdapter(
        padding: defaultMargin.copyWith(top: 0.0),
        child: Wrap(
          spacing: defaultMargin.left,
          runSpacing: defaultMargin.bottom,
          children: module.items
                  ?.where((bangumi) => bangumi.title?.isNotEmpty ?? false)
                  .map(
                    (bangumi) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        bangumi.title ?? "",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  )
                  .toList() ?? []
        ),
      ),
      sliverToBoxAdapter(child: Divider()),
    ];
  }
}
