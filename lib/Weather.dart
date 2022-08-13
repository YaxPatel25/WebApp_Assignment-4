import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 27.0)),
              new Text(
                'Weather Screen',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          )),
    );
  }
}