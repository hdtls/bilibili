import 'dart:math';
import 'package:flutter/material.dart';

import '../compenents/bb_media_thumbnail_view.dart';
import '../utils/bb_args.dart';
import '../models/bb_channel.dart';

class BBChannelListSection extends StatelessWidget {
  final Channel channel;
  const BBChannelListSection({Key? key, required this.channel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      channel.title ?? channel.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    Text(channel.desc1 ?? "",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              channel.descButton?.text != null
                  ? GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin.left * 2,
                          vertical: defaultMargin.top / 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text(
                            channel.descButton?.text ?? "",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: defaultMargin.bottom),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultMargin.left,
              childAspectRatio: 16 / 14,
            ),
            itemBuilder: (BuildContext context, int index) {
              Media media = channel.items![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: BBThumbnailView(
                      url: media.cover,
                      topLeftIconAndDescriptions: [
                        ThumbnailImageLabel(
                            icon: media.badge?.imageUrl,
                            label: media.badge?.text),
                      ],
                      bottomLeftIconAndDescriptions: [
                        ThumbnailImageLabel(
                            icon: media.coverLeftIcon1,
                            label: media.coverLeftText1),
                        ThumbnailImageLabel(
                            icon: media.coverLeftIcon2,
                            label: media.coverLeftText2),
                      ],
                      bottomRightIconAndDescriptions: [
                        ThumbnailImageLabel(label: media.coverLeftText3),
                      ],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  SizedBox(height: defaultMargin.bottom),
                  Expanded(
                    child: Text(
                      media.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
            itemCount: min(channel.items?.length ?? 0, 2),
          ),
          channel.descButton2?.text != null
              ? Text(
                  channel.descButton2!.text!,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
