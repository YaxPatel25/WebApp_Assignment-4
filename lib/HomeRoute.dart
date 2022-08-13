import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(140.0)),
              new Padding(padding: EdgeInsets.only(top: 27.0)),
              new Text(
                'Home Screen',
                style: new TextStyle(fontSize: 16.0),
              ),
            ],
          )),
    );
  }
}