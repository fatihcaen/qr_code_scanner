import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner/scan_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Code Scanner',
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          "/Scan": (BuildContext context) => ScanScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        drawer: _drawer,
        body: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              color: Colors.deepOrange,
              onPressed: () {
                Navigator.pushNamed(context, '/Scan');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget get _appBar => AppBar(
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
                  color: Colors.deepOrange,
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
}
