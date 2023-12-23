// ignore_for_file: constant_identifier_names


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


import 'package:firebase_database/firebase_database.dart';

import '../Models/UserModle.dart';


class FirebaseHandler extends ChangeNotifier {

  bool isSignIn = false;
  String phoneNo = "",
      otp = "";

  bool _showProgress = false;
  Widget? _progressIndicator;

  bool get showProgress => _showProgress;

  void startProgress(BuildContext context) {
    _showProgress = true;
    _progressIndicator = CircularProgressIndicator();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _progressIndicator!,
                SizedBox(height: 16),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }


  void stopProgress(BuildContext context) {
    _showProgress = false;
    if (_progressIndicator != null) {
      Navigator.of(context).pop();
      _progressIndicator = null;
    }
  }


  Future<void> CreateUserUsingEmail(Function(bool error) callback,
      UserModel userModel, bool isLogin) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      if (!isLogin) {
        userModel.uid = FirebaseAuth.instance.currentUser!.uid;
        SaveUserData(callback, userModel);
      } else {
        callback(true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        callback(true);

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        callback(true);

      }
    } catch (e) {
      print("error");
      print(e);
    }

    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email,String password,Function(bool,String) callback) async{
    print("inside class"+email);
    print("inside class"+password);
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    print(firebaseAuth.currentUser?.email);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      callback(true,"Login");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        callback(false,'user-not-found');

      } else if (e.code == 'wrong-password') {

        callback(false,'wrong-password');

      }
    }
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM y').format(now);

    return formattedDate;
  }

  Future signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    return Future.delayed(Duration.zero);
  }

  void SaveUserData(Function(bool err) callback, UserModel userModel) async {
    userModel.join_date = _getCurrentDate();

    DatabaseReference dbRef = FirebaseDatabase.instance.reference();

    Map<String, dynamic> data = userModel.toJson();

    String path = 'Users/${userModel.uid}';
    dbRef.child(path).set(data).then((value) {

      callback(false);

    }).catchError((error) {
      callback(true);
      signOut();
      print('Failed to push data to the database: $error');
    });
  }

}





