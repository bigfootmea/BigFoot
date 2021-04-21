import 'dart:ui';

import 'package:flutter/material.dart';
import './widget/basic/asset_player_widget.dart';
import './profile_page.dart';
import './widget/ideas/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BigFoot',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BigFoot"),
        titleTextStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            AssetPlayerWidget(),
            ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                      title: Text(
                        'About Us',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()))),
                ),
                Card(
                  child: ListTile(
                      title: Text(
                        'Expert Opinion',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => null),
                ),
                Card(
                  child: ListTile(
                      title: Text(
                        'ideas',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Idea()))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
