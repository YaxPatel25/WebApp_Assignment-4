import 'package:assignment4/HomeRoute.dart';
import 'package:assignment4/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AuthService.dart';
import 'UserModel.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
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
