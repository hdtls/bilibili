import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../models/bb_channel.dart';
import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';

class BBChannelListSliverDynamics extends StatelessWidget {
  final List<Channel> channels;
  const BBChannelListSliverDynamics(this.channels, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: defaultMargin,
        height: 71.0,
        child: Swiper(
          itemBuilder: _itemBuilder,
          itemCount: channels.length,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          onTap: (int index) {
            _onTap(context, channels[index]);
          },
        ),
      ),
    );
  }

  void _onTap(BuildContext context, Channel c) {
    // ignore: avoid_print
    print("CHANNEL CLICKED !!!");
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Channel channel = channels[index];
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: defaultMargin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: BBNetworkImage(
                channel.cover,
                placeholder: Images.channel,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin.left),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(channel.title ?? ""),
                    Text(
                      channel.desc ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            channel.button?.text != null
                ? GestureDetector(
                    child: Container(
                      height: 24.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin.left * 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          channel.button?.text ?? "",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      _onTap(context, channel);
                    },
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
