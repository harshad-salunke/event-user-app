import 'package:event_booking_application/Models/EventModle.dart';
import 'package:event_booking_application/Models/UserModle.dart';
import 'package:event_booking_application/utils/app_colors.dart';
import 'package:event_booking_application/widgets/home_page/popular_events_card.dart';
import 'package:flutter/material.dart';

import '../../../FirebaseDAO/DatabaseDAO.dart';
import '../../../all_screens/event_detail_screen.dart';
import '../../../all_screens/user_event_details_screen.dart';
import '../../events_page/EventsCard.dart';
import '../BookingCard.dart';

class BookingActivePage extends StatefulWidget {
  UserModel userModle;
  BookingActivePage({required this.userModle}) ;

  @override
  State<BookingActivePage> createState() => _BookingActivePageState();
}

class _BookingActivePageState extends State<BookingActivePage> {

  DatabaseDAO databaseDAO=DatabaseDAO();
  List<EventsModel> eventlist=[];
  bool isloaded=false;
  @override
  void initState() {
    super.initState();
    databaseDAO.userRegisterAllEvents((List<EventsModel>list){

      print(list.length);
      if(eventlist.isNotEmpty){
        eventlist.clear();
      }
      if (mounted) {
        setState(() {
          list.forEach((event) {
            if(event.timestamp==""){
              eventlist.add(event);
            }
          });
          isloaded = true;
        });
      }


    } , widget.userModle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:isloaded?ListView.builder(
          itemCount:eventlist.length,
          itemBuilder: (BuildContext con,int index){
            return InkWell(
              onTap: (){
                print(index);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserEventDetailScreen(eventsModel: eventlist[index],userModel: widget.userModle,)));
              },
              child: BookingCard(
                text: "Active",
                bg_color: MyAppColor.green_light,
                textColor: Colors.green,
                eventsModle: eventlist[index],
              ),
            );
          }):Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
        ) ,
      ),
    );
  }
}

