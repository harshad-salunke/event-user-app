import 'package:event_booking_application/FirebaseDAO/DatabaseDAO.dart';
import 'package:event_booking_application/Models/UserModle.dart';
import 'package:event_booking_application/widgets/home_page/event_hero_section.dart';
import 'package:event_booking_application/widgets/home_page/event_section.dart';
import 'package:flutter/material.dart';

import '../widgets/home_page/event_upcoming_section.dart';
import '../widgets/home_page/heading_widget.dart';
class HomeScreen extends StatefulWidget {
  UserModel userModel;
  HomeScreen({required this.userModel}) ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeadingWidget(
            userModel: widget.userModel,
          ),
          EventsSection(),
          EventHeroSection(),
          EventUpcoming(),
        ],
      ),
    );
  }
}
