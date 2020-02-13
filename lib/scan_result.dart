import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/scan_screen.dart';
import 'package:qr_scanner/uihelper.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:image/image.dart';

class ScanResult extends StatelessWidget {
  String scanResult;

  ScanResult({Key key, @required this.scanResult}) : super(key: key);

  QrImage get _qrImage => QrImage(
        data: scanResult,
        version: QrVersions.auto,
        size: 320,
        gapless: false,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan Result:',
              style: TextStyle(
                fontSize: 20,
                color: UIHelper.primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 200,
                  child: SingleChildScrollView(
                    child: Text(
                      scanResult,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: UIHelper.primaryColor,
                onPressed: () {
                  Share.share(
                      'Here is the qr result i got from QR Code Scanner by fatihcandev!' +
                          ' -> ' +
                          scanResult);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: UIHelper.primaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Scan');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings_backup_restore,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Scan Again',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: UIHelper.primaryColor,
                onPressed: () {
                  // File('generatedQR.png').writeAsBytesSync(encodePng(_qrImage));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Generate QR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
