import 'package:flutter/material.dart';
import 'strings.dart';

void main() => runApp(new PocFlutterApp());

class PocFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      home: new PoCFlutter(),
    );
  }
}

class PoCFlutter extends StatefulWidget {
  @override
  createState() => new PoCFlutterState();
}

class PoCFlutterState extends State<PoCFlutter> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new Text(Strings.appMidText),
    );
  }
}