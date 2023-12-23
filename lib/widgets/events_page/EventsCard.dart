import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/EventModle.dart';
import '../../utils/app_colors.dart';
class EventsCard extends StatelessWidget {
  String text;
  Color textColor;
  Color bg_color;
  EventsModel eventsModle;
  EventsCard({required this.text,required this.textColor,required this.bg_color, required this.eventsModle}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,

      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(

                child: Image(
                  image: AssetImage(
                      "assets/images/java.png"
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${eventsModle.event_name}",
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("${eventsModle.date} ${eventsModle.stared}",
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: MyAppColor.black_light,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                        color:Colors.red ,),
                      Text("${eventsModle.event_location}",
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Icon(Icons.circle,color: Colors.indigo,
                    size: 15,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("By Sumago Team",
                    style: GoogleFonts.ubuntu(
                        color: MyAppColor.black_light
                    ),)
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: bg_color,

                ),
                padding: EdgeInsets.all(7),
                child: Text("$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:textColor,
                      fontSize: 16
                  ),

                ),

              )

            ],
          )
        ],
      ),
    );

  }
}
