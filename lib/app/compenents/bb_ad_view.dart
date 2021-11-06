import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class BBAdView<Ad> extends StatelessWidget {
  final List<Ad>? advertise;
  final Widget Function(BuildContext, int) itemBuilder;
  final double? aspectRatio;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Axis scrollDirection;
  final ScrollPhysics? physics;

  const BBAdView({
    Key? key,
    this.advertise,
    this.aspectRatio,
    this.borderRadius,
    this.border,
    this.scrollDirection = Axis.horizontal,
    this.physics,
    required this.itemBuilder,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return aspectRatio != null
        ? AspectRatio(
            aspectRatio: aspectRatio as double,
            child: _swiper(),
          )
        : _swiper();
  }

  Widget _swiper() {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: Swiper(
          scrollDirection: scrollDirection,
          itemBuilder: itemBuilder,
          itemCount: advertise?.length ?? 0,
          autoplay: true,
          physics: physics,
        ),
      ),
    );
  }
}
