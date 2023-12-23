import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:event_booking_application/all_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/UserModle.dart';


class ProfileScreen extends StatefulWidget {
  UserModel userModel;
  ProfileScreen({required this.userModel}) ;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(12),
          physics: BouncingScrollPhysics(), //use this for a bouncing experience
          children: [

            Container(height: 35),
            headingWidget(),
            colorTiles(),
            divider(),
            bwTiles(),
          ],
        ),
      ),
    );
  }
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
  Widget headingWidget(){
    return Column(
      children: [
        SizedBox(height: 50,),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/harshad.png"),
          radius: 50,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.userModel.name}",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget colorTiles() {
    return Column(
      children: [
        GestureDetector(
            onTap: () {

            },
            child: colorTile(
                Icons.person_outline, Colors.deepPurple, "Personal data")),
        GestureDetector(
          child: colorTile(
              Icons.contact_emergency_rounded, Colors.blue, "Contact"),
          onTap: () async {
            var url =
                'https://www.sumagoinfotech.com/';
            if (await canLaunch(url)) {
              await launch(url, forceWebView: false);
            }
          },
        ),
        GestureDetector(
          child: colorTile(Icons.local_police, Colors.pink, "Privacy Policy"),
          onTap: () async {
            var url = 'https://www.sumagoinfotech.com/';
            if (await canLaunch(url)) {
              await launch(url, forceWebView: false);
            }
          },
        ),
        GestureDetector(
            onTap: () {
              logoutUser();
            },
            child: colorTile(Icons.logout, Colors.orange, "Logout")),
      ],
    );
  }

  Widget bwTiles() {
    // Color color = Colors.blueGrey.shade800; not satisfied, so let us pick it
    return Column(
      children: [
        bwTile(Icons.star_rate_outlined, "Rate Us"),
        GestureDetector(
            onTap: () {
              exit(0);
            },
            child: bwTile(Icons.exit_to_app, "Exit")),
      ],
    );
  }

  Widget bwTile(IconData icon, String text) {
    return colorTile(icon, Colors.black, text, blackAndWhite: true);
  }

  Widget colorTile(IconData icon, Color color, String text,
      {bool blackAndWhite = false}) {
    Color pickedColor = Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        child: Icon(icon, color: color),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? pickedColor : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(text,

          textScaleFactor: 1,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
    );
  }

  void logoutToast() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hii, there!',
        message: 'Logout Successfully',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    logoutToast();
    Navigator.popUntil(context, (route) => false);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
