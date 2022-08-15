import 'package:assignment4/AuthService.dart';
import 'package:assignment4/Weather.dart';
import 'package:assignment4/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LogIn.dart';
import 'SignUp.dart';

// This is main file to redirect from one screen to another screen
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MultiProvider(
      providers:[
        Provider<AuthService>(create: (_) => AuthService(),),
      ],
      child: MaterialApp(

        //Title of main screen
        title: 'SignUp/LogIn Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        // Giving initial path when the is going to run
        initialRoute: '/signup',

        //Allocate screens to particular path
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => LogIn(),
          '/signup': (context) => SignUp(),
          '/weather': (context) => Weather(),
        },
      )
    );
  }
}