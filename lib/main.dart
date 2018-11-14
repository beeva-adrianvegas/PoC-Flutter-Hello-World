import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  //underscore makes the members of the class private
  var _members = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    //Los miembros de nuestra organizacion son privados asi que mostraremos los de flutter
    String dataURL = "https://api.github.com/orgs/flutter/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      _members = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

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