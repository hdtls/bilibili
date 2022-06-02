import 'package:flutter/material.dart';

import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';
import '../models/bb_room.dart';

class BBLiveHomeCardView extends StatelessWidget {
  final Room item;
  final bool showAvatar;
  const BBLiveHomeCardView({Key? key, required this.item, this.showAvatar = false}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: BBThumbnailView(
            url: item.cover,
            borderRadius: BorderRadius.circular(5.0),
            topLeftIconAndDescriptions: _pendent(item.pendentList?.toList(), 2),
            topRightIconAndDescriptions:
                _pendent(item.pendentList?.toList(), 1),
            bottomLeftIconAndDescriptions: [
              ThumbnailImageLabel(label: item.uname),
            ],
            bottomRightIconAndDescriptions: [
              ThumbnailImageLabel(icon: 9, label: "${item.online}"),
            ],
          ),
        ),
        SizedBox(height: defaultMargin.bottom),
        Expanded(
          child: showAvatar
              ? Row(
                  children: <Widget>[
                    BBNetworkCircleAvatarImage(
                      item.face,
                      radius: 18.0,
                      extra: item.officialVerify == 1 ? Image.asset(Images.officialVerify) : null,
                    ),
                    SizedBox(width: defaultMargin.left),
                    Expanded(
                      child: _textLayoutView(context),
                    ),
                  ],
                )
              : _textLayoutView(context),
        ),
      ],
    );
  }

  Widget _textLayoutView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          item.title ?? "",
          maxLines: 1,
        ),
        Expanded(child: 
          Text(
            item.areaV2Name ?? "",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }

  List<ThumbnailImageLabel>? _pendent(
      List<LivePendent>? pendents, int position) {
    LivePendent? pendent = pendents?.firstWhereOrNull((e) => e.pic != null && e.position == position);

    return pendent != null ? [ThumbnailImageLabel(icon: pendent.pic, label: pendent.content)] : null;
  }
}
