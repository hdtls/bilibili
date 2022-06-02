import 'package:flutter/material.dart';

enum BBNaviLinkAnimation {
  push,
  pop,
  present,
  dismiss,
}

class BBNavigationLink extends StatelessWidget {
  final bool rootNavigator;
  final String? destination;
  final BBNaviLinkAnimation animation;
  final Object? arguments;
  final Widget? child;
  final void Function()? onTap;

  const BBNavigationLink({
    Key? key,
    this.rootNavigator = true,
    this.animation = BBNaviLinkAnimation.push,
    this.destination,
    this.arguments,
    this.child,
    this.onTap,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails d) {
        if (onTap != null) {
          onTap!();
        }
        if (destination?.isEmpty ?? true) {
          return;
        }

        switch (animation) {
          case BBNaviLinkAnimation.push:
          case BBNaviLinkAnimation.present:
            Navigator.of(context, rootNavigator: rootNavigator)
                .pushNamed(destination!);
            break;
          case BBNaviLinkAnimation.pop:
          case BBNaviLinkAnimation.dismiss:
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            break;
        }
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
