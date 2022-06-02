import 'package:flutter/material.dart';

import '../utils/bb_args.dart';
import '../utils/bb_utils.dart';
import '../api/bb_api.dart';
import '../compenents/bb_ui.dart';

class BBPartationListView extends StatefulWidget {
  const BBPartationListView({Key? key}) : super(key: key);

  @override
  State<BBPartationListView> createState() => _BBPartationListViewState();
}

class _BBPartationListViewState extends State<BBPartationListView> {
  late List<Partation> _partations;

  @override
  void initState() {
    super.initState();
    _partations = [];
    _onLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: GridView.builder(
        padding: defaultMargin,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: defaultMargin.bottom * 2,
          crossAxisSpacing: defaultMargin.left,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (BuildContext context, int index) {
          Partation partation = _partations[index];
          return BBAppView(image: partation.logo, title: partation.name);
        },
        itemCount: _partations.length,
      ),
    );
  }

  void _onLoading() async {
    try {
      HttpListBody<Partation> p = await BBApi.requestAllPartion();
      if (mounted) {
        setState(() {
          _partations = p.data?.toList() ?? [];
        });
      }
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(Object e) {}
}
