import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirebaseDAO/DatabaseDAO.dart';
import '../Models/EventModle.dart';
import '../Models/UserModle.dart';
import '../utils/app_colors.dart';
import '../widgets/sliding_banner_widget.dart';

class UserEventDetailScreen extends StatefulWidget {
  EventsModel eventsModel;
  UserModel userModel;
  UserEventDetailScreen({required this.eventsModel,required this.userModel});

  @override
  State<UserEventDetailScreen> createState() => _UserEventDetailScreenState();
}

class _UserEventDetailScreenState extends State<UserEventDetailScreen> {
  DatabaseDAO databaseDAO = DatabaseDAO();
  bool isDone=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Event Details',
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Event Highlights',
                style: GoogleFonts.alike(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SlidingBanner(),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Event Name : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.title,size: 20,),
                          SizedBox(width: 5,),
                          Text(
                            '${widget.eventsModel.event_name}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Event Type : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.category,size: 20,),
                          SizedBox(width: 8,),
                          Text(
                            '${widget.eventsModel.category}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Discription : ",

                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.book_outlined,size: 20,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Text(
                              '${widget.eventsModel.event_discription}',
                              overflow: TextOverflow.ellipsis, // Optional: Use ellipsis (...) to indicate overflow
                              softWrap: true, // Allow soft wrapping of the text
                              style: GoogleFonts.ubuntu(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Event Venue : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.location_on,size: 20,),
                          SizedBox(width: 5,),

                          Text(
                            '${widget.eventsModel.event_location}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Event Date : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.date_range_outlined,size: 20,),
                          SizedBox(width: 5,),
                          Text(
                            '${widget.eventsModel.date}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Start Time : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.access_time_outlined,size: 20,),
                          SizedBox(width: 5,),
                          Text(
                            '${widget.eventsModel.stared}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "End Time : ",
                            style: GoogleFonts.openSans(
                                fontSize: 18, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.access_time_outlined,size: 20,),
                          SizedBox(width: 5,),
                          Text(
                            '${widget.eventsModel.end}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              isDone?Container(
                height: 60,
                width: 400,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)))),
                    child: Text("Go To Booking Page",
                      style: GoogleFonts.openSans(
                          color: Colors.white
                      ),)),
              ) : Container(
                height: 60,
                width: 400,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(

                    onPressed: (){
                      widget.eventsModel.timestamp="0";

                      databaseDAO.registerUserForEvent(widget.eventsModel,widget.userModel, (isdone){
                        if(isdone){
                          cancelregisterToast();
                          setState(() {
                            isDone=true;
                          });
                        }
                      });

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,

                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.all(Radius.circular(5)))),
                    child: Text("Cancelled",
                      style: GoogleFonts.openSans(
                          color: Colors.white
                      ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void cancelregisterToast() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hii, there!',
        message: 'Successfully  UnRegister for the Event ',
        contentType: ContentType.warning,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}
