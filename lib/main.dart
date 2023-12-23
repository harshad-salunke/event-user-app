import 'package:event_booking_application/all_screens/login_screen.dart';
import 'package:event_booking_application/all_screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isUserSignedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserSignInStatus();
  }

  void checkUserSignInStatus() {
    print("current user ${_firebaseAuth.currentUser?.email}");
    User? user = _firebaseAuth.currentUser;
    setState(() {
      _isUserSignedIn = user != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pune Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _isUserSignedIn ? MainScreen() : LoginScreen(),

    );
  }
}
