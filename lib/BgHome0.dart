import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BgHome0 extends StatefulWidget {
  @override
  _BgHome0State createState() => _BgHome0State(url: "http://iqrayukkk.herokuapp.com/", title: "title");
}

class _BgHome0State extends State<BgHome0> {
  _BgHome0State({this.url, this.title});
  final String url;
  final String title;
  Future<List> getData() async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ListVideo(
                    list: snapshot.data,
                  )
                : new Center(child: new CircularProgressIndicator());
          }),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(children: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Videoplay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",))),
              child: new Container(
                height: 210.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            list[i]['snippet']['thumbnails']['high']['url']),
                        fit: BoxFit.cover)),
              ),
          ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new Text(list[i]['snippet']['title'],
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            )
          ]),
        );
      },
    );
  }
}

class Videoplay extends StatelessWidget {
  final String url;
  Videoplay({this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new WebviewScaffold(url: url),
    );
  }
}