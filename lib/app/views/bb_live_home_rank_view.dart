import 'package:flutter/material.dart';

import '../utils/bb_args.dart';
import '../utils/bb_additions.dart';
import '../compenents/bb_network_circle_avatar_image.dart';
import '../models/bb_live_group.dart';
import '../models/bb_room.dart';

class BBLiveHomeRankView extends StatelessWidget {
  final LiveGroup<Room> section;

  const BBLiveHomeRankView({Key? key, required this.section}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fix sort order with 2 1 3;
    Room? goldMedal =
        section.list?.firstWhereOrNull((e) => e.rank == 1);
    Room? silverMedal =
        section.list?.firstWhereOrNull((e) => e.rank == 2);
    Room? bronzeMedal =
        section.list?.firstWhereOrNull((e) => e.rank == 3);

    List<Room> models = [];
    if (silverMedal != null) {
      models.add(silverMedal);
    }
    if (goldMedal != null) {
      models.add(goldMedal);
    }
    if (bronzeMedal != null) {
      models.add(bronzeMedal);
    }

    return models.isEmpty
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Wrap(
                spacing: 24.0,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: models.map((e) {
                  return _getRankItem(context, e);
                }).toList(),
              ),
            ),
          );
  }

  Widget _getRankItem(BuildContext context, Room rank) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _getRankAvatarView(context, rank),
        SizedBox(
          height: defaultMargin.top / 2,
        ),
        Text(rank.uname ?? ""),
        Text(
          rank.areaV2ParentName ?? "",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).hintColor),
        ),
      ],
    );
  }

  // Rank title (e.g. crown).
  Widget _getRankAvatarView(BuildContext context, Room rank) {
    double horizontal = 9.0;
    EdgeInsets edgeInsets =
        EdgeInsets.only(top: 14.0, left: horizontal, right: horizontal);
    double radius = rank.rank == 1 ? 35.0 : 30.0;

    return [1, 2, 3].contains(rank.rank)
        ? Stack(
            children: [
              Image.asset(
                  "assets/images/live_home_ranking_${rank.rank}32x32.png"),
              Container(
                margin: edgeInsets,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/misc_battery_rank${rank.rank}_bg48x48.png",
                      width: radius * 2,
                      height: radius * 2,
                      fit: BoxFit.cover,
                    ),
                    BBNetworkCircleAvatarImage(
                      rank.face,
                      radius: radius - 2,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: radius + edgeInsets.left,
                child: rank.liveStatus == 1
                    ? Image.asset(
                        "assets/images/live_home_ranking_living${Theme.of(context).brightness == Brightness.light ? "" : "night"}38x14.png",
                      )
                    : SizedBox.shrink(),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
