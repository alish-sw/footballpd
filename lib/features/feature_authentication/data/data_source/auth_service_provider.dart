import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';


import '../models/user_model.dart';

class AuthServiceProvider{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  ///create new user
  Future<UserModel?> signUpUser(String email,String password)async
  {
    try
    {
      final UserCredential userCredential=
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
      final User? firebaseUser=userCredential.user;
      if(firebaseUser!=null)
        {
          return UserModel(
            id: firebaseUser.uid,
            email: firebaseUser.email??'',
            displayName: firebaseUser.displayName??'',

          );
        }
    }
    on FirebaseAuthException catch(e)
    {
        if (kDebugMode) {
          print(e.toString());
        }
    }
    return null;
  }

  ///signOutUser
  Future<void>signOutUser()async
  {
    final User? firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser !=null)
    {
      await FirebaseAuth.instance.signOut();
    }
  }
}