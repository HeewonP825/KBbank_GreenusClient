import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbank_practice/models/friendList.dart';

import '../../constants.dart';
import '../../theme.dart';
import 'friendListScreen.dart';

class FriendSearch extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Texto $index");

  @override
  _FriendSearchState createState() => _FriendSearchState();
}

class _FriendSearchState extends State<FriendSearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              },
              icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text("Search Bar"),
      ),
      body: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              widget.list[index]
            ),
          ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  late String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildLeading
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample = ['Text1', 'Text2', 'Text5'];
  Search(listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> _suggesrtionList = [];
    query.isEmpty
        ? _suggesrtionList = recentList
        : _suggesrtionList
        .addAll(listExample.where((element) => element.contains(query)));

    return ListView.builder(
      itemCount: _suggesrtionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_suggesrtionList[index]),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = _suggesrtionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}