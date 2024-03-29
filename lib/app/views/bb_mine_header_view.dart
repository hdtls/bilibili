import 'package:flutter/material.dart';

import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';
import '../models/bb_mine.dart';

class BBMineHeaderView extends StatelessWidget {
  final Mine mine;
  const BBMineHeaderView({Key? key, required this.mine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin.left),
          height: 44.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(Images.mineQR),
              SizedBox(
                width: defaultMargin.right * 2,
              ),
              Image.asset(Images.mineTheme),
              SizedBox(
                width: defaultMargin.right * 2,
              ),
              Image.asset(Images.mineSettings),
            ],
          ),
        ),
        Padding(
          padding: defaultMargin.copyWith(top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  BBNetworkCircleAvatarImage(
                    mine.face,
                    pendant: mine.pendant?.image,
                    placeholder: Images.defaultAvatar,
                    extra: mine.vip?.type == 2
                        ? Image.asset(Images.bigV(Theme.of(context).brightness))
                        : null,
                    radius: 20.0,
                  ),
                  SizedBox(width: defaultMargin.left),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _title(context),
                      _vipLabel(context),
                      _coin(context),
                    ],
                  ),
                ],
              ),
              Image.asset(Images.rightArrow),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin.left),
          child: Divider(),
        ),
        _vip(context),
        Container(
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.symmetric(vertical: defaultMargin.bottom),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: defaultMargin.bottom),
            child: Row(
              children: <Widget>[
                _tab(context, "动态", mine.dynamics),
                _tab(context, "关注", mine.following),
                _tab(context, "粉丝", mine.follower),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tab(BuildContext context, String title, int? num) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            "${num ?? 0}",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
          ),
          SizedBox(height: defaultMargin.bottom / 2),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          mine.name ?? "",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          width: defaultMargin.left / 2,
        ),
        Image.asset(Images.sex(mine.sex)),
        SizedBox(
          width: defaultMargin.left / 2,
        ),
        Image.asset(Images.themeMiscUserLevel(
            Theme.of(context).brightness, mine.level)),
      ],
    );
  }

  Widget _vipLabel(BuildContext context) {
    TextAttributes? textAttributes;
    if (mine.vip?.type == 1) {
      textAttributes = TextAttributes((b) => b
        ..text = "正式会员"
        ..textColor = "#F6749A"
        ..darkModeTextColor = "F6749A"
        ..darkModeBorderColor = "#FFFFFF");
    } else if (mine.vip?.type == 2) {
      textAttributes = TextAttributes((b) => b
        ..text = "年度大会员"
        ..textColor = "#FFFFFF"
        ..backgroundColor = "#F6749A");
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultMargin.bottom / 2),
      child: BBMediaTagView(textAttributes: textAttributes),
    );
  }

  Widget _coin(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("B币：${mine.bcoin ?? 0}",
            style: Theme.of(context).textTheme.bodySmall),
        SizedBox(width: defaultMargin.left * 2),
        Text("硬币：${mine.coin ?? 0}",
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _vip(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                mine.vipSectionV2?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(width: defaultMargin.left / 2),
              Text(mine.vipSectionV2?.subtitle ?? "",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Image.asset(Images.rightArrow),
        ],
      ),
    );
  }
}
