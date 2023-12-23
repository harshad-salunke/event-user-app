import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirebaseDAO/DatabaseDAO.dart';
import '../Models/EventModle.dart';
import '../Models/UserModle.dart';
import '../utils/app_colors.dart';
import '../widgets/events_page/EventsCard.dart';
import 'event_detail_screen.dart';

class EventScreen extends StatefulWidget {
  UserModel userModel;
  EventScreen({required this.userModel}) ;
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DatabaseDAO databaseDAO=DatabaseDAO();
  List<EventsModel> eventlist=[];
  List<EventsModel> pastEventlist=[];
  List<EventsModel> upcomingEventlist=[];

  bool isloaded=false;
  @override
  void initState() {
    super.initState();
    databaseDAO.readAllEvents((List<EventsModel> list ){
      filterOutEvents(list);
      setState(() {
        print(list.length);
        if(eventlist.isNotEmpty){
          eventlist.clear();
        }

        eventlist=list;
        isloaded=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text("Events",
            style: GoogleFonts.openSans(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
          isloaded?
          Expanded(
            child: ListView.builder(
                itemCount: eventlist.length,
                itemBuilder: (BuildContext con,int index){
                  return InkWell(
                    onTap: (){
                      print(index);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailScreen(eventsModel: eventlist[index],userModel: widget.userModel,)));
                    },
                    child: EventsCard(
                      text: "upcoming",
                      bg_color: MyAppColor.green_light,
                      textColor: Colors.green,
                      eventsModle: eventlist[index],
                    ),
                  );
                }),
          ):Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            ),
          )

        ],
      ),
    );
  }

  void filterOutEvents(List<EventsModel> list) {

    List<EventsModel> pastEventlist=[];
    eventlist.forEach((element) {
      String? date=element.date;
   DateTime dateTime=   DateTime.parse("${date?.split('/')[2]}-${date?.split('/')[1]}-${date?.split('/')[0]}");
      DateTime currentDate = DateTime.now();
      if(dateTime.isBefore(currentDate)){

      }

    });

  }
}
