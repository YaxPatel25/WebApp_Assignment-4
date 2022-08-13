import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AuthService.dart';

class SignUp extends StatelessWidget {

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
        title: "Welcome to Flutter",
        home: new Material(
            child: new Container(
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(children: [
                        new Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 100)),
                        new Text(
                          'Sign Up',
                          style: new TextStyle(fontSize: 35.0),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 50.0)),
                        new TextFormField(
                          controller: emailController,
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if (val!.length == 0) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),
                        new TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                            prefixIcon: Icon(Icons.security),

                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if (val!.length == 0) {
                              return "Password cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          //keyboardType: TextInputType.visiblePassword,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),
                        new TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.security),

                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
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
                        ElevatedButton(
                          onPressed: () async{
                             await authService.createInWithEmailAndPassword(
                                 emailController.text,
                                 passwordController.text
                             );
                             Navigator.pushNamed(context, '/');
                          },
                          child: Text('Sign Up'),

                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 12),
                              textStyle: TextStyle(
                                fontSize: 20,
                              )),
                        ),
                        new Padding(padding: EdgeInsets.only(top: 35.0)),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text("Have An Account? Log In",
                              style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              color: Colors.lightBlueAccent
                            ),
                              textAlign: TextAlign.center,))
                      ])),
                ))));
  }
}
