import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Screen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 27.0)),
              new Text(
                'News Screen',
                style: new TextStyle(fontSize: 16.0),
              ),

            ],
          )),
    );
  }
}