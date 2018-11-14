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
    //BBVANext members are private so i will show flutter members
    String dataURL = "https://api.github.com/orgs/flutter/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      try{
        _members = json.decode(response.body);
      }catch(e){
        print("Error on json.decode $e");
      }
    });
  }

  Widget _buildRow(int i) {
    return new ListTile(
        title: new Text("${_members[i]["login"]}", style: _biggerFont)
    );
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
      body: new ListView.builder(//Similar to RecyclerView on Android and a UITableView on iOS
          padding: const EdgeInsets.all(16.0),
          itemCount: _members.length,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
          }),
    );
  }
}