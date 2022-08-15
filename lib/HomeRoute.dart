import 'package:flutter/material.dart';

//This the home screen which comes after log-in

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        //Title for home screen
        title: Text('Home Screen'),
        elevation: 0,
      ),
      body: Center(
          child: Column(

            //To align the items in center
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 35.0)),

              // Code for weather button
              ElevatedButton(
                child: Text('Weather'),

                // Will redirect to weather screen
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