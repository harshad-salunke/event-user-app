
import 'package:event_booking_application/Models/UserModle.dart';
import 'package:event_booking_application/all_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../FirebaseDAO/DatabaseDAO.dart';
import '../utils/app_colors.dart';
import 'booking_page.dart';
import 'event_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late  PageController pageController;
  DatabaseDAO databaseDAO=DatabaseDAO();
  UserModel userModel=UserModel(phone_number: "", name: "", uid: "", join_date: "", gender: "", email: "", password: "");

  int currentPage=0;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    databaseDAO.getUserData((bool loaded,UserModel user){
      if(loaded){
        setState(() {
          userModel=user;
        });
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentPage=index;
          });
        },
        children: [
          HomeScreen(
            userModel: userModel,
          ),
          BookingScreen(
            userModel: userModel,
          ),
          EventScreen(
            userModel: userModel,
          ),
          ProfileScreen(
            userModel: userModel,
          )

        ],
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
              gap: 8, // the tab button gap between icon and text
              activeColor: MyAppColor.primary_color, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: MyAppColor.primary_light, // selected tab background color
              padding: EdgeInsets.all(10) ,
              selectedIndex: currentPage,
              onTabChange: (index){
                pageController.jumpToPage(index);
              },// navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.library_books_outlined,
                  text: 'Booking',
                ),
                GButton(
                  icon: Icons.storefront,
                  text: 'Events',
                ),
                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Profile',
                )
              ]
          ),
        ),
      ),
    );
  }
}
