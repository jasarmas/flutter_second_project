import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numbersList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Stack(children: <Widget>[_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numbersList[index];
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/id/$image/500/300"),
            placeholder: AssetImage("assets/jar-loading (2).gif"),
          );
        },
      ),
    );
  }

  Future<Null> getFirstPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _lastItem++;
      _addTen();
    });

    return Future.delayed(duration);
  }

  void _addTen() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addTen();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
