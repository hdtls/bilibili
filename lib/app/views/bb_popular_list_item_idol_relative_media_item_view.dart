import 'package:flutter/material.dart';

import 'package:bilibili/app/utils/bb_args.dart';
import 'package:bilibili/app/compenents/bb_media_thumbnail_view.dart';

class BBPopularListItemIdolRelativeMediaItemView extends StatelessWidget {
  const BBPopularListItemIdolRelativeMediaItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 8.0 / 5.0,
          child: BBThumbnailView(
            url:
                "https://i0.hdslb.com/bfs/archive/363aa721e698dca557ea7aabd556476e625fcbe4.jpg@320w_200h.jpg",
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        SizedBox(
          height: defaultMargin.top / 2,
        ),
        Text(
          "看好了这才是体术与剑术的极致巅峰！",
          maxLines: 2,
        ),
      ],
    );
  }
}
