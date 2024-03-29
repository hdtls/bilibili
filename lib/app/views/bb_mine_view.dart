import 'package:flutter/material.dart';

import '../api/bb_api.dart';
import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';
import '../models/bb_models.dart';
import 'bb_mine_header_view.dart';

class BBMineView extends StatefulWidget {
  const BBMineView({Key? key}) : super(key: key);

  @override
  State<BBMineView> createState() => _BBMineViewState();
}

class _BBMineViewState extends State<BBMineView> {
  Mine _mine = Mine();

  @override
  void initState() {
    super.initState();
    _onLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BBMineHeaderView(mine: _mine),
          Expanded(
            child: CustomScrollView(
              slivers: (_mine.sections?.toList() ?? [])
                  .map((services) => <Widget>[
                        _sliverSectionHeader(context, services),
                        _sliverGrid(services.items?.toList() ?? []),
                        SliverToBoxAdapter(
                          child: services != _mine.sections?.toList().last
                              ? Container(
                                  height: defaultMargin.bottom,
                                  color: Theme.of(context).colorScheme.background,
                                )
                              : const SizedBox.shrink(),
                        )
                      ])
                  .expand((sliver) => sliver)
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _sliverSectionHeader(BuildContext context, Module<Service> services) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 44.0),
            child: Container(
              padding: defaultMargin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(services.title ?? "",
                      style: Theme.of(context).textTheme.titleLarge),
                  // Creative center need a post button to support user contribution.
                  services.type == 1 && _mine.showCreative == 1
                      ? GestureDetector(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                width: 9,
                                height: 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultMargin.left * 1.5,
                                    vertical: defaultMargin.bottom / 2),
                                margin: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(Images.mineUploadDraft),
                                    SizedBox(width: defaultMargin.left / 2),
                                    Text(
                                      "投稿",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // ignore: avoid_print
                            print("CONTRIBUTION !!!");
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _sliverGrid(List<Service> services) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin.left),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Stack(
                  // alignment: Alignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 30.0),
                        child: BBNetworkImage(
                          services[index].icon,
                          aspectRatio: 1.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    _dot(services[index]),
                  ],
                ),
                SizedBox(height: defaultMargin.bottom),
                Text(
                  services[index].title ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
              ],
            );
          },
          childCount: services.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
      ),
    );
  }

  Widget _dot(Service service) {
    return service.redDot != null
        ? Positioned(
            top: 3,
            right: 0,
            width: 13,
            height: 13,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                  child: Text(
                "${service.redDot}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  decoration: TextDecoration.none,
                ),
              )),
            ),
          )
        : SizedBox.shrink();
  }

  void _onLoading() async {
    HttpBody<Mine> httpBody = await BBApi.requestMine();

    if (mounted) {
      setState(() {
        _mine = httpBody.data!;
      });
    }
  }
}
