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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
            ],
          )),
    );
  }
}