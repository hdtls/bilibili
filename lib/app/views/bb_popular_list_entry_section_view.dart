import 'package:flutter/material.dart';

import '../utils/bb_args.dart';
import '../utils/bb_utils.dart';
import '../compenents/bb_ui.dart';

class BBPopularListEntrySectionView extends StatelessWidget {

  final List<dynamic> entries;
  const BBPopularListEntrySectionView({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin.left),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: defaultMargin.left * 2,
            mainAxisSpacing: defaultMargin.top),
        itemCount: entries.length,
        itemBuilder: (context, i) {
          return BBAppView(
                      title: "entries[i].title",
                      image: null,
                      imageSize: const Size(44.0, 44.0),
                    );
        },
      );
  }
}