import 'dart:ui';

import 'package:flutter/material.dart';

extension BBColor on Color {
  static Color? fromHexString(String? hexString, {int alpha = 100}) {
    if (hexString?.isEmpty ?? true) {
      return null;
    }

    hexString = hexString!.replaceAll("#", "");

    try {
      var intValue = int.tryParse(hexString, radix: 16);

      if (intValue == null) {
        return null;
      }
      return Color(intValue).withOpacity(alpha / 100);
    } on Exception {
      return null;
    }
  }
}
