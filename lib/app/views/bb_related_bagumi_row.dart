import 'package:flutter/material.dart';

import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';

class BBRelatedBangumiRow extends StatefulWidget {
  const BBRelatedBangumiRow({Key? key}) : super(key: key);

  @override
  State<BBRelatedBangumiRow> createState() => _BBRelatedBangumiRowState();
}

class _BBRelatedBangumiRowState extends State<BBRelatedBangumiRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultMargin.bottom),
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 3 / 2.5,
            child: BBThumbnailView(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          SizedBox(width: defaultMargin.left),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Fate/stay night [Unlimited Blade Works] 第一季",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text("全13话"),
                SizedBox(height: defaultMargin.bottom / 2),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(Images.thumbnailOverlays[1]),
                        SizedBox(width: defaultMargin.left / 2),
                        Text("1.3亿"),
                      ],
                    ),
                    SizedBox(width: defaultMargin.left * 2),
                    Row(
                      children: <Widget>[
                        Image.asset(Images.thumbnailOverlays[1]),
                        SizedBox(width: defaultMargin.left / 2),
                        Text("323万"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: defaultMargin.left),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
              Text.rich(
                TextSpan(
                  text: "9.3",
                  children: <InlineSpan>[TextSpan(text: "分")],
                ),
              ),
              Text("1.3万人"),
            ],
          ),
        ],
      ),
    );
  }
}
