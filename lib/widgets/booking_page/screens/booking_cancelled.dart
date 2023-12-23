import 'package:event_booking_application/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../FirebaseDAO/DatabaseDAO.dart';
import '../../../Models/EventModle.dart';
import '../../../Models/UserModle.dart';
import '../../../all_screens/user_event_details_screen.dart';
import '../BookingCard.dart';
class BookingCancelled extends StatefulWidget {
  UserModel userModle;
  BookingCancelled({required this.userModle}) ;

  @override
  State<BookingCancelled> createState() => _BookingCancelledState();
}

class _BookingCancelledState extends State<BookingCancelled> {
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
            if(event.timestamp=="0"){
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
      child:isloaded? ListView.builder(
          itemCount:eventlist.length,
          itemBuilder: (BuildContext con,int index){
            return InkWell(
              onTap: (){
                print(index);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserEventDetailScreen(eventsModel: eventlist[index],userModel: widget.userModle,)));
              },
              child: BookingCard(
                text: "Cancelled",
                bg_color: MyAppColor.white_light,
                textColor: Colors.red,
                eventsModle: eventlist[index],
              ),
            );
          }):Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
        ),
      )
    );
  }
}

