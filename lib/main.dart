import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/utils/color_helper.dart';
import 'package:flutter_web/view/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LicenseRegistry.addLicense(() async* {
      final license =
          await rootBundle.loadString('assets/fonts/poppins/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luthfikhan',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: ColorHelper.colorFromHex('#0E0C38'),
        primaryColorDark: ColorHelper.colorFromHex('#040221'),
        primaryColorLight: ColorHelper.colorFromHex('#0c2038'),
        accentColor: ColorHelper.colorFromHex('#FF0513'),
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}
