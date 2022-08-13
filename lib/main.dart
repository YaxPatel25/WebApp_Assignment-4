// import 'package:firebase_auth/firebase_auth.dart';
import 'package:assignment4/AuthService.dart';
import 'package:assignment4/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomeRoute.dart';
import 'LogIn.dart';
import 'SignUp.dart';
// import 'package:firebase_core/firebase_core.dart';
//import 'package:url_launcher/url_launcher.dart';

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
        title: 'SignUp/LogIn Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => LogIn(),
          '/signup': (context) => SignUp(),
        },
      )
    );
  }
}