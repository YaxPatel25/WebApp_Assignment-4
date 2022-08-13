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
              ElevatedButton(
                child: Text('Calender'),
                onPressed: () {
                  Navigator.pushNamed(context, '/calender');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 128, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
              new Padding(padding: EdgeInsets.only(top: 35.0)),
              ElevatedButton(
                child: Text('Weather'),
                onPressed: () {
                  Navigator.pushNamed(context, '/weather');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
              new Padding(padding: EdgeInsets.only(top: 35.0)),
              ElevatedButton(
                child: Text('News'),
                onPressed: () {
                  Navigator.pushNamed(context, '/news');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ],
          )),
    );
  }
}