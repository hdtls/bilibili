import 'package:flutter/material.dart';

import '../utils/bb_args.dart';
import 'bb_related_bagumi_row.dart';

class BBRelatedMediaListView extends StatefulWidget {
  const BBRelatedMediaListView({Key? key}) : super(key: key);

  @override
  State<BBRelatedMediaListView> createState() => _BBRelatedMediaListViewState();
}

class _BBRelatedMediaListViewState extends State<BBRelatedMediaListView> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(),
          SliverPadding(
            padding: defaultMargin.copyWith(bottom: 0.0),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: const <Widget>[
                      Expanded(child: BBRelatedBangumiRow()),
                      Divider(),
                    ],
                  );
                },
                childCount: 10,
              ),
              itemExtent: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}
