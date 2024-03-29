import 'package:flutter/material.dart';

import '../models/bb_media.dart';
import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';

class BBFeaturedListItemMultipleColumView extends StatelessWidget {
  final Media media;
  const BBFeaturedListItemMultipleColumView({Key? key, required this.media})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAdType2View =
        media.cardType == "cm_v2" && media.adInfo?.cardType == 2;
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultMargin.top),
      child: isAdType2View
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: defaultMargin,
                  child: _getPreviewDescriptionTitleView(context, media),
                ),
                _getPreviewView(context, media, aspectRatio: 16 / 4),
                Container(
                  margin: defaultMargin,
                  child: _getPreviewDescriptionExtraMsgView(context, media),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                _getPreviewView(context, media),
                _getPreviewDescriptionView(context, media),
              ],
            ),
    );
  }

  // Media preview contains image, tag and other extra message
  // like number of visited and danmuku.
  Widget _getPreviewView(BuildContext context, Media media,
      {double aspectRatio = 16 / 9}) {
    bool isAdView = media.cardType == "cm_v2";
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: aspectRatio,
          child: BBNetworkImage(
            isAdView ? media.adInfo?.creativeContent?.imageUrl : media.cover,
            placeholder: Images.placeholder,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _getPreviewExtraMsgView(context, media),
        ),
      ],
    );
  }

  // Media tag.
  Widget _getTagView(
      BuildContext context, TextAttributesDifinations? textAttributes) {
    return (textAttributes?.text?.isEmpty ?? true)
        ? SizedBox.shrink()
        : Container(
            margin: EdgeInsets.only(right: defaultMargin.right),
            decoration: BoxDecoration(
              color: BBColor.fromHexString(
                Theme.of(context).brightness == Brightness.light
                    ? textAttributes?.backgroundColor
                    : textAttributes?.darkModeBackgroundColor,
              ),
              border: Border.all(
                color: BBColor.fromHexString(
                      Theme.of(context).brightness == Brightness.light
                          ? textAttributes?.borderColor
                          : textAttributes?.darkModeBorderColor,
                    ) ?? Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(3.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Center(
              child: Text(
                textAttributes?.text ?? "",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: BBColor.fromHexString(
                        Theme.of(context).brightness == Brightness.light
                            ? textAttributes?.textColor
                            : textAttributes?.darkModeTextColor,
                      ),
                    ),
              ),
            ),
          );
  }

  // Preview extra message display view contains extra msg
  // like danmuku number and others.
  Widget _getPreviewExtraMsgView(BuildContext context, Media media) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Colors.transparent, Colors.black26],
        ),
      ),
      child: Padding(
        padding: (defaultMargin / 2).copyWith(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                _getPreviewExtraMsgIndicatorView(
                    context, media.coverLeftText1, media.coverLeftIcon1),
                SizedBox(width: defaultMargin.left),
                _getPreviewExtraMsgIndicatorView(
                    context, media.coverLeftText2, media.coverLeftIcon2),
              ],
            ),
            _getPreviewExtraMsgIndicatorView(
                context, media.coverRightText, null),
          ],
        ),
      ),
    );
  }

  Widget _getPreviewExtraMsgIndicatorView(
      BuildContext context, String? text, int? index) {
    List<String> icons = [
      "pegasus_card_ic_star16x16.png",
      "pegasus_card_ic_play16x16.png",
      "pegasus_card_ic_location16x16.png",
      "pegasus_card_ic_danmaku16x16.png",
      "pegasus_card_ic_follow16x16.png",
      "pegasus_card_ic_article16x16.png",
      "pegasus_card_ic_comment16x16.png",
      "pegasus_card_ic_like16x16.png",
      "pegasus_card_ic_liked16x16.png",
      "pegasus_card_ic_people16x16.png",
    ];
    return index != null && index < icons.length
        ? Row(
            children: <Widget>[
              Image.asset(
                "assets/images/${icons[index]}",
                color: Colors.white,
              ),
              SizedBox(width: 3),
              Text(
                media.coverLeftText1 ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white),
              )
            ],
          )
        : text != null
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white),
              )
            : SizedBox.shrink();
  }

  Widget _getPreviewDescriptionView(BuildContext context, Media media) {
    return Container(
      height: 70.0,
      margin: defaultMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getPreviewDescriptionTitleView(context, media),
          _getPreviewDescriptionExtraMsgView(context, media),
        ],
      ),
    );
  }

  Widget _getPreviewDescriptionTitleView(BuildContext context, Media media) {
    bool isAdView = media.cardType == "cm_v2";
    return Text(
      isAdView
          ? (media.adInfo?.creativeContent?.title ?? "")
          : media.title ?? "",
      maxLines: 2,
    );
  }

  Widget _getPreviewDescriptionExtraMsgView(BuildContext context, Media media) {
    bool isAdView = media.cardType == "cm_v2";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getTagView(context, media.rcmdReasonStyle),
        _getTagView(
            context,
            isAdView
                ? media.adInfo?.extra?.card?.adTagStyle
                : media.badgeStyle),
        Expanded(
          child: Text(
              isAdView
                  ? media.adInfo?.creativeContent?.description ?? ""
                  : media.descButton?.text ?? "",
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall),
        ),
        SizedBox(
          width: defaultMargin.left / 2,
        ),
        GestureDetector(
          child:
              Image.asset("assets/images/pegasus_card_vertical_more16x16.png"),
          onTap: () {
            debugPrint("Accessory action triggle.");
          },
        ),
      ],
    );
  }
}
