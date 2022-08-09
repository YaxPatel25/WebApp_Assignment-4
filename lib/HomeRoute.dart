import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp/LogIn Screen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(140.0)),
              ElevatedButton(
                child: Text('Log In'),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 128, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
              new Padding(padding: EdgeInsets.only(top: 27.0)),
              new Text(
                'OR',
                style: new TextStyle(fontSize: 16.0),
              ),
              new Padding(padding: EdgeInsets.only(top: 25.0)),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ],
          )),
    );
  }
}