import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bilibili/app/utils/bb_args.dart';

class BBNotFoundView extends StatelessWidget {
  const BBNotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: defaultMargin,
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/circle_notAllowed150x130.png",
                      width: 150.0,
                      height: 130.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("您访问的页面不见了/(ToT)/~~"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
