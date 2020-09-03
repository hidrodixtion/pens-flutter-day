import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trying_day_one/listitem.dart';
import 'package:trying_day_one/service/api.dart';

import 'model/team.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var teams = List<Team>();
  var isLoading = false;

  void _fetchTeam() async {
    setState(() {
      isLoading = true;
    });

    var tempTeams = await Api().getTeams();
    print(tempTeams);

    setState(() {
      teams = tempTeams;
      isLoading = false;
    });
  }

  Widget _getItem(String title, Color borderColor) {
    return ListItem(borderColor, title);
  }

  Color _getColor() {
    var random = Random().nextInt(Colors.primaries.length - 1);
    return Colors.primaries[random];
  }

  List<Widget> _getMoreItem() {
    var items = List<Widget>();
    for (var i = 0; i < 100; i++) {
      items.add(_getItem("${i+1}", _getColor()));
    }
    return items;
  }

  List<Widget> _getTeamItem() {
    var items = List<Widget>();
    for (var i = 0; i < teams.length; i++) {
      items.add(_getItem(teams[i].teamName, _getColor()));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _getTeamItem(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchTeam,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
