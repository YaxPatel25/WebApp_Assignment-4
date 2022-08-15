import 'package:assignment4/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  //If user exist then it will return the user's data
  User? _userFromFirebase(auth.User? user){
    if(user == null){
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  //Code for signin with firebase
  Future<User?> signInWithEmailAndPassword(
      String email,
      String password,
      ) async{
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return _userFromFirebase(credential.user);
  }

  //Code to register a user in firebase
  Future<User?> createInWithEmailAndPassword(
      String email,
      String password,
      ) async{
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return _userFromFirebase(credential.user);
  }

  //make signout from the app
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}