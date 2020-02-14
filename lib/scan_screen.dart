import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:qr_mobile_vision/qr_mobile_vision.dart';
import 'package:qr_scanner/scan_result.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String scanResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250.0,
                  height: 250.0,
                  child: QrCamera(
                    qrCodeCallback: (code) {
                      setState(() {
                        scanResult = code;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScanResult(
                            scanResult: scanResult,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _appBar => AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/Home');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('QR Code Scanner'),
      );
}
