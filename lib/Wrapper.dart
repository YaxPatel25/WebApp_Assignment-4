import 'package:assignment4/HomeRoute.dart';
import 'package:assignment4/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AuthService.dart';
import 'UserModel.dart';

// this class will keep user log in until unless he/she will press log out

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){

        //Code to check if user is there then it will redirect to home screen else it will redirect to log in screen
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? LogIn() : HomeRoute();
        }else{
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
      }
    );
  }
}
