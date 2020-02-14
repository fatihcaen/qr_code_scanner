import 'package:flutter/material.dart';
import 'package:qr_scanner/uihelper.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: _drawer,
      body: _body,
    );
  }

  Widget get _appBar => AppBar(
        backgroundColor: UIHelper.primaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('QR Code Scanner'),
      );

  Widget get _drawer => Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Qr Code Scanner',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'by fatihcandev',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: UIHelper.primaryColor,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                //
              },
            ),
            ListTile(
              title: Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                //
              },
            ),
          ],
        ),
      );

  Widget get _body => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        _tapToScan,
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget get _tapToScan => SizedBox(
        width: 175,
        child: RaisedButton(
          padding: EdgeInsets.all(10),
          color: UIHelper.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/Scan');
          },
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(
                Icons.photo_camera,
                color: Colors.white,
                size: 25,
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
              ),
              Text(
                'Tap To Scan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _padding20 => Padding(
        padding: EdgeInsets.only(bottom: 20),
      );
}
