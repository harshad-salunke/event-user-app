
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlidingBanner extends StatefulWidget {
  const SlidingBanner({Key? key}) : super(key: key);

  @override
  State<SlidingBanner> createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  height: 170,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 900),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index,reason){
                    setState(() {
                      current_index=index;
                    });
                  }

              ),
              items: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/event1.jpg"),
                    fit: BoxFit.cover,

                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage("assets/images/event2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage("assets/images/event3.jpg"),
                    fit: BoxFit.fill,

                  ),
                )

              ]
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<3;i++)
                Container(
                  width: 15,
                  height: 5,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: i==current_index?Color(0xff9e0093):Colors.purple.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),





            ],
          )

        ],
      ),
    );
  }
}
