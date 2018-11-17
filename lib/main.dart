import 'package:flutter/material.dart';

import 'pocflutter.dart';
import 'strings.dart';

void main() => runApp(new PocFlutterApp());

class PocFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: new ThemeData(primaryColor: Colors.lightBlueAccent),
      home: new PoCFlutter(),
    );
  }
}








