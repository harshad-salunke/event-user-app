
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirebaseDAO/DatabaseDAO.dart';
import '../Models/EventModle.dart';
import '../Models/UserModle.dart';
import '../widgets/booking_page/booking_nav_bar.dart';
import '../widgets/booking_page/screens/booking_active.dart';
import '../widgets/booking_page/screens/booking_cancelled.dart';
import '../widgets/booking_page/screens/booking_completed.dart';

class BookingScreen extends StatefulWidget {
  UserModel userModel;
  BookingScreen({required this.userModel}) ;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late  PageController pageController;
  int currentpage=0;

  DatabaseDAO databaseDAO=DatabaseDAO();
  List<EventsModel> eventlist=[];
  bool isloaded=false;
  @override
  void initState() {
    super.initState();
    pageController=PageController(initialPage: 0);
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SizedBox(height: 50,),
          Text("Bookings",
            style: GoogleFonts.openSans(
                fontSize: 25,
                fontWeight: FontWeight.bold

            ),),
          BookingNavBar(
            callback: (index){
              pageController.jumpToPage(index);
            },
            current: currentpage,
          ),
          Expanded(
            child: PageView(
              controller:pageController,
              onPageChanged: (index){
                setState(() {
                  currentpage=index;
                });
              },
              children: [
                BookingActivePage(
                  userModle: widget.userModel,
                ),
                BookingCompleted(
                  userModle: widget.userModel,
                ),
                BookingCancelled(
                  userModle: widget.userModel,
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
