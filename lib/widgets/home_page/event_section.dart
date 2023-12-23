
import 'package:event_booking_application/widgets/home_page/popular_events_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class EventsSection extends StatefulWidget {
  const EventsSection({Key? key}) : super(key: key);

  @override
  State<EventsSection> createState() => _EventsSectionState();
}

class _EventsSectionState extends State<EventsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Popular Events",
                style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'View all',
                style: GoogleFonts.openSans(fontSize: 13, color: MyAppColor.primary_color),
              )
            ],
          ),
         SizedBox(
           height: 10,
         ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                EventCard(
                  img: "java.png",
                  title: "Technical Event",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),
                EventCard(
                  img: "java.png",
                  title: "Soft Skills",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),
                EventCard(
                  img: "java.png",
                  title: "Personal Development",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),
                EventCard(
                  img: "java.png",
                  title: "Human Development",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
