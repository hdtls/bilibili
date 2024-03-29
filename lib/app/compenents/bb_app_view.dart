import 'dart:math';

import 'package:flutter/material.dart';

import '../compenents/bb_network_image.dart';

enum ImageLayoutAttributes {
  top,
  left,
  bottom,
  right,
}

class BBAppView extends StatelessWidget {
  final double spacing;
  final String? image;
  final Size imageSize;
  final String? title;
  final TextStyle? style;
  final ImageLayoutAttributes layoutAttributes;

  const BBAppView({
    Key? key,
    this.image,
    this.title,
    this.spacing = 8.0,
    this.imageSize = const Size(39.0, 39.0),
    this.style = const TextStyle(fontSize: 12.0),
    this.layoutAttributes = ImageLayoutAttributes.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return layoutAttributes == ImageLayoutAttributes.left ||
            layoutAttributes == ImageLayoutAttributes.right
        ? Row(
            children: _children(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _children(),
          );
  }

  List<Widget> _children() {
    List<Widget> children = [];
    if (image != null) {
      children.add(Expanded(
        child: Center(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double width = min(imageSize.width, constraints.maxWidth);
            double height = min(imageSize.height, constraints.maxHeight);

            return ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: width,
                height: height,
              ),
              child: BBNetworkImage(image),
            );
          }),
        ),
      ));
    }
    if (title != null) {
      Widget textLabel = Text(
        title!,
        style: style ??
            TextStyle(
              fontSize: 12.0,
            ),
        maxLines: 1,
      );
      layoutAttributes == ImageLayoutAttributes.left ||
              layoutAttributes == ImageLayoutAttributes.top
          ? children.add(textLabel)
          : children.insert(0, textLabel);
    }
    if (children.length == 2) {
      SizedBox box = layoutAttributes == ImageLayoutAttributes.left ||
              layoutAttributes == ImageLayoutAttributes.right
          ? SizedBox(width: spacing)
          : SizedBox(height: spacing);
      children.insert(1, box);
    }
    return children;
  }
}
