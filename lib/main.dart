import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner/home.dart';
import 'package:qr_scanner/scan_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Code Scanner',
        home: Home(),
        routes: <String, WidgetBuilder>{
          "/Scan": (BuildContext context) => ScanScreen(),
        });
  }
}
