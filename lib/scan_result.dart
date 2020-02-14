import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/scan_screen.dart';
import 'package:qr_scanner/uihelper.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:image/image.dart';

class ScanResult extends StatefulWidget {
  String scanResult;

  ScanResult({Key key, @required this.scanResult}) : super(key: key);
  @override
  _ScanResultState createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
  // QrImage get _qrImage => QrImage(
  //       data: widget.scanResult,
  //       version: QrVersions.auto,
  //       size: 320,
  //       gapless: false,
  //     );

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
                      widget.scanResult,
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
            _share,
            _padding25,
            _scanAgain,
            _padding25,
            _backHome,
            _padding25,
          ],
        ),
      ),
    );
  }

  Widget get _share => SizedBox(
        width: 250,
        height: 50,
        child: RaisedButton(
          color: UIHelper.primaryColor,
          onPressed: () {
            Share.share(
                'Here is the qr result i got from QR Code Scanner by fatihcandev!' +
                    ' -> ' +
                    widget.scanResult);
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
      );

  Widget get _scanAgain => SizedBox(
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
      );

  // Widget get _generateQR => SizedBox(
  //       width: 250,
  //       height: 50,
  //       child: RaisedButton(
  //         color: UIHelper.primaryColor,
  //         onPressed: () {
  //           // File('generatedQR.png').writeAsBytesSync(encodePng(_qrImage));
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             Icon(
  //               FontAwesomeIcons.qrcode,
  //               color: Colors.white,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(right: 10),
  //             ),
  //             Text(
  //               'Generate QR',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w400,
  //                   fontSize: 20),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  Widget get _backHome => SizedBox(
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
                Icons.arrow_back,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      );

  Widget get _padding25 => Padding(
        padding: EdgeInsets.only(top: 25),
      );
}
