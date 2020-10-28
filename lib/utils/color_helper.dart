import 'package:flutter/material.dart';

class ColorHelper {
  static Color colorFromHex(String hexString) {
    final buffer = StringBuffer();

    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16)).withOpacity(1);
  }
}
