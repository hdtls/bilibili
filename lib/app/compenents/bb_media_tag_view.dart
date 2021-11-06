import 'package:flutter/material.dart';

import '../utils/bb_utils.dart';
import '../models/bb_text_attributes_definations.dart';

export '../models/bb_text_attributes.dart';

class BBMediaTagView extends StatelessWidget {
  final TextAttributesDifinations? textAttributes;
  final BorderRadius? borderRadius;
  final EdgeInsets contentInsets;
  const BBMediaTagView({
    Key? key,
    this.textAttributes,
    this.borderRadius,
    this.contentInsets = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (textAttributes?.text?.isEmpty ?? true)
        ? SizedBox.shrink()
        : Container(
            padding: contentInsets,
            decoration: BoxDecoration(
              color: BBColor.fromHexString(
                  Theme.of(context).brightness == Brightness.light
                      ? textAttributes?.backgroundColor
                      : textAttributes?.darkModeBackgroundColor),
              border: Border.all(
                color: BBColor.fromHexString(
                      Theme.of(context).brightness == Brightness.light
                          ? textAttributes?.textColor
                          : textAttributes?.darkModeTextColor) ?? Colors.transparent,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(2.0),
            ),
            child: Center(
              child: Text(
                textAttributes?.text ?? "",
                style: TextStyle(
                  fontSize: 10.0,
                  color: BBColor.fromHexString(
                      Theme.of(context).brightness == Brightness.light
                          ? textAttributes?.textColor
                          : textAttributes?.darkModeTextColor),
                ),
              ),
            ),
          );
  }
}
