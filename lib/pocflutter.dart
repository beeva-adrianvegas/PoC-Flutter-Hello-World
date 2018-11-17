import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'member.dart';
import 'strings.dart';

class PoCFlutter extends StatefulWidget {
  @override
  createState() => new PoCFlutterState();
}

class PoCFlutterState extends State<PoCFlutter> {

  //underscore makes the members of the class private
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    //BBVANext members are private so i will show flutter members
    String dataURL = "https://api.github.com/orgs/flutter/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = new Member(memberJSON["login"],
            memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new ListView.builder(
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return new Divider();
            final index = position ~/ 2;
            return _buildRow(index);
          }),
    );
  }


  Widget _buildRow(int i) {
    return new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListTile(
          title: new Text("${_members[i].login}", style: _biggerFont),
          leading: new CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: new NetworkImage(_members[i].avatarUrl)
          ),
        )
    );
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }
}