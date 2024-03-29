import 'package:flutter/material.dart';

import '../utils/bb_args.dart';
import '../utils/bb_assets.dart';

class BBExchangeView extends StatelessWidget {
  final Color color;
  final void Function()? onTap;

  const BBExchangeView({
    Key? key,
    this.color = const Color(0xFFF6749A),
    this.onTap,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Spacer(),
            Image.asset(
              Images.exchange,
              color: color,
            ),
            SizedBox(width: defaultMargin.left),
            Text(
              "换一换",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
