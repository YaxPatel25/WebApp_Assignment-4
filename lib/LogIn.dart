import 'package:assignment4/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Code for LogIn screen which come at the starting of the app

class LogIn extends StatelessWidget {

  //Declaring variables to get email and password from a user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    final authService = Provider.of<AuthService>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Material(
            child: new Container(
                padding: const EdgeInsets.all(30.0),

                //Background color
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(children: [
                        new Padding(padding: EdgeInsets.fromLTRB(0, 130, 0, 130)),

                        //Code for Log In text
                        new Text(
                          'Log In',
                          style: new TextStyle(fontSize: 35.0),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 50.0)),

                        // Code for email text input
                        new TextFormField(
                          controller: emailController,
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                          ),

                          // Code for checking valid email
                          validator: (val) {
                            if (val!.length == 0) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),

                        // Code for getting password from a user
                        new TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                            prefixIcon: Icon(Icons.security),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),

                          // Check the password is empty or not
                          validator: (val) {
                            if (val!.length == 0) {
                              return "Password cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),

                        //Code for log in button
                        ElevatedButton(
                          onPressed: () async{

                            // wait for login by fetching data from firebase and redirect to homescreen
                            await logIn();
                            Navigator.pop(context);
                          },
                          child: Text('Log In'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 12),
                              textStyle: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),

                        // Code to redirect signup screen if user want to create an account
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text("Doen not have An Account? SignUp",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  color: Colors.lightBlueAccent),
                              textAlign: TextAlign.center,))
                      ])),
                ))));
  }

  // This function will fetch data from firebase
  Future logIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),password: passwordController.text.trim());
  }
}