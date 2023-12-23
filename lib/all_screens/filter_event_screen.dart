import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirebaseDAO/DatabaseDAO.dart';
import '../Models/EventModle.dart';
import '../Models/UserModle.dart';
import '../utils/app_colors.dart';
import '../widgets/events_page/EventsCard.dart';
import 'event_detail_screen.dart';

class FilterEventScreen extends StatefulWidget {
  UserModel userModel;
  FilterEventScreen({required this.userModel}) ;
  @override
  State<FilterEventScreen> createState() => _FilterEventScreenState();
}

class _FilterEventScreenState extends State<FilterEventScreen> {
  DatabaseDAO databaseDAO=DatabaseDAO();
  List<EventsModel> eventlist=[];
  bool isloaded=false;
  @override
  void initState() {
    super.initState();
    databaseDAO.readAllEvents((List<EventsModel> list ){
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
}
