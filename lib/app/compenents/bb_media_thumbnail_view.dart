import 'package:flutter/material.dart';

import '../utils/bb_assets.dart';
import 'bb_network_image.dart';

class ThumbnailImageLabel {
  final dynamic icon;
  final String? label;

  const ThumbnailImageLabel({this.icon, this.label});
}

// Media preview contains image, tag and other extra message
// like number of visited and danmuku.
class BBThumbnailView extends StatelessWidget {
  final String? url;

  // The view located in top left of image, if the value is not null
  // `topLeftIconAndDescriptions` will be ignored.
  final Widget? topLeftView;

  // The icon and icon description, icon maybe index of local images
  // set see `_imageURLs` for more information, or network image url.
  final List<ThumbnailImageLabel>? topLeftIconAndDescriptions;

  // see `topLeftView` for more info.
  final Widget? topRightView;
  final List<ThumbnailImageLabel>? topRightIconAndDescriptions;

  // see `topLeftView` for more info.
  final Widget? bottomLeftView;
  final List<ThumbnailImageLabel>? bottomLeftIconAndDescriptions;

  // see `topLeftView` for more info.
  final Widget? bottomRightView;
  final List<ThumbnailImageLabel>? bottomRightIconAndDescriptions;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final BorderRadius borderRadius;

  final EdgeInsets _edgeInsets = EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 4.0);

  BBThumbnailView({
    Key? key,
    this.url,
    this.topLeftView,
    this.topLeftIconAndDescriptions,
    this.topRightView,
    this.topRightIconAndDescriptions,
    this.bottomLeftView,
    this.bottomLeftIconAndDescriptions,
    this.bottomRightView,
    this.bottomRightIconAndDescriptions,
    this.foregroundColor,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: _edgeInsets.top),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                foregroundDecoration: BoxDecoration(
                  color: foregroundColor,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    BBNetworkImage(
                      url,
                      placeholder: Images.placeholder,
                    ),
                    _getGridientView(
                        height: constraints.maxHeight != double.infinity
                            ? constraints.maxHeight / 3
                            : 34.0),
                    _getBottomView(context),
                    _getTopRightView(),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: borderRadius == BorderRadius.zero
                ? BorderRadius.zero
                : BorderRadius.only(topLeft: borderRadius.topLeft),
            child: _getTopLeftView(),
          ),
        ],
      );
    });
  }

  Widget _getGridientView({double? height}) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      right: 0.0,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.transparent, Colors.black38],
          ),
        ),
      ),
    );
  }

  Widget _getTopLeftView() {
    return topLeftView != null
        ? Padding(
            padding: EdgeInsets.only(top: _edgeInsets.top),
            child: topLeftView,
          )
        : SizedBox(
            height: 20.0,
            child: (topLeftIconAndDescriptions?.isEmpty ?? true)
                ? SizedBox.shrink()
                : Stack(children: <Widget>[
                    BBNetworkImage(topLeftIconAndDescriptions?.first.icon),
                    Positioned(
                      top: 3.0,
                      left: 25.0,
                      child: Text(
                        topLeftIconAndDescriptions?.first.label ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.5,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ]),
          );
  }

  Widget _getTopRightView() {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: topRightView ??
          SizedBox(
            height: 20.0,
            child: (topRightIconAndDescriptions?.isEmpty ?? true)
                ? SizedBox.shrink()
                : BBNetworkImage(topRightIconAndDescriptions?.first.icon),
          ),
    );
  }

  Widget _getBottomView(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      right: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getBottomLeftView(context),
          _getBottomRightView(context),
        ],
      ),
    );
  }

  Widget _getBottomLeftView(BuildContext context) {
    return bottomLeftView ??
        Padding(
          padding: EdgeInsets.only(
              left: _edgeInsets.left, bottom: _edgeInsets.bottom),
          child: Row(
            children: _getIconAndDescriptionViews(
                    context, bottomLeftIconAndDescriptions),
          ),
        );
  }

  Widget _getBottomRightView(BuildContext context) {
    return bottomRightView ??
        Padding(
          padding: EdgeInsets.only(
              right: _edgeInsets.right, bottom: _edgeInsets.bottom),
          child: Row(
            children: _getIconAndDescriptionViews(
                    context, bottomRightIconAndDescriptions),
          ),
        );
  }

  List<Widget> _getIconAndDescriptionViews(
      BuildContext context, List<ThumbnailImageLabel>? iconAndDescriptions) {
    List<Widget> views = [];
    for (var e in (iconAndDescriptions ?? [])) {
      if (e.icon is int &&
          e.icon >= 0 &&
          e.icon < Images.thumbnailOverlays.length) {
        views.add(Image.asset(
          Images.thumbnailOverlays[e.icon],
          color: Colors.white,
        ));
        views.add(SizedBox(width: 2.0));
      }

      if (e.icon is String && (e.icon as String).isNotEmpty) {
        views.add(BBNetworkImage(e.icon));
      }

      if (e.label != null) {
        views.add(Text(
          e.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.5,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        ));
        views.add(SizedBox(
          width: 8.0,
        ));
      }
    }
    if (views.isNotEmpty && views.last is SizedBox) {
      views.removeLast();
    }
    return views;
  }
}
