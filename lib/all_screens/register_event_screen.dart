import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
class RegisterEventScreen extends StatefulWidget {
  const RegisterEventScreen({Key? key}) : super(key: key);

  @override
  State<RegisterEventScreen> createState() => _RegisterEventScreenState();
}

class _RegisterEventScreenState extends State<RegisterEventScreen> {
  late TextEditingController fullnamecontroller=TextEditingController();
  late TextEditingController emailController=TextEditingController();

  late TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    child:Icon(Icons.arrow_back_rounded)
                  ),
                ),
                SizedBox(width: 50,),
                Text("Registration Form",
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold

                  ),),
              ],
            ),

            SizedBox(height: 50,),

            SizedBox(
              height: 60,
              child: TextField(
                controller: fullnamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,

                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff9e0093))),
                    labelText: "Full Name",
                    hintText: "Enter your full name",
                    prefixIcon: Icon(Icons.supervised_user_circle)),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 60,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,

                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff9e0093))),
                    labelText: "Email",
                    hintText: "Enter your Email",
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 60,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,

                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff9e0093))),
                    labelText: "Address",
                    hintText: "Enter your address",
                    prefixIcon: Icon(Icons.location_on)),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(

              child: ElevatedButton(

                  onPressed: () {

                 },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyAppColor.primary_color,

                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  child: Text("Register",
                    style: GoogleFonts.openSans(
                        color: Colors.white
                    ),)),
            ),
          ],
        ),
      ),
    );
  }
}
