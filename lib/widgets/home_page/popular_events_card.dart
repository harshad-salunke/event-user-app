import 'package:flutter/material.dart';
class EventCard extends StatelessWidget {
  String img;
  String title;
  Color bg_color;
  Color icon_color;
  EventCard({
    required this.img,
    required this.title,
    required this.bg_color,
    required this.icon_color
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color:bg_color ,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage("assets/images/$img"),
                height: 70,
                width: 70,
              ),
            )),
        Text("$title",
        style: TextStyle(
          fontSize: 10
        ),)
      ],
    );
  }
}
