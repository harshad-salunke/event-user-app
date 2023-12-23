import 'package:flutter/material.dart';

import '../../../Models/UserModle.dart';
import '../BookingCard.dart';
class BookingCompleted extends StatefulWidget {
  UserModel userModle;
  BookingCompleted({required this.userModle}) ;

  @override
  State<BookingCompleted> createState() => _BookingCompletedState();
}

class _BookingCompletedState extends State<BookingCompleted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext con,int index){
            return Container();
          }),
    );
  }
}
