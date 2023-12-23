import 'package:event_booking_application/all_screens/register_event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class EventHeroSection extends StatelessWidget {
  const EventHeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 15, 0),
      margin: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            " Book Events of pune",
            style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Select Event that you want to attend",
            style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children:[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.stadium_outlined,
                    size: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: MyAppColor.primary_color,
                  size: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.add_circle_outline,
                   size: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: MyAppColor.primary_color,
                  size: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.check_circle_outlined,
                    size: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),

              ],
            ),

              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Text(" Select\nEvents",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),),
                    Text(" Register \n Event",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),),
                    Text(" Event\nBooked",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),)
                
                
                  ],
                ),
              )
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterEventScreen()),
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyAppColor.primary_color,

                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                child: Text("Register Now",
                    style: GoogleFonts.openSans(
                    color: Colors.white
                ),)),
          ),
        ],
      ),
    );
  }
}
