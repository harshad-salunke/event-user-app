import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:event_booking_application/Models/UserModle.dart';
import 'package:event_booking_application/all_screens/home_screen.dart';
import 'package:event_booking_application/all_screens/main_screen.dart';
import 'package:event_booking_application/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FirebaseDAO/FirebaseHandler.dart';
import '../widgets/RegisterScreen/drop_downlist.dart';
import '../widgets/register_user/MyTextField.dart';

import '../testController/RegistrationControler.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegistrationController registrationController=new RegistrationController();

  var gender_list=[
    "Male",
    "Female",
    "Other"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.white_light,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                     margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                      height: 50,
                      width: 50,
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
                   Container(
                   margin: EdgeInsets.fromLTRB(25, 3, 0, 0),

                   child: Text("Hello!  Register to get \nStarted",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                 ),

                  const SizedBox(height: 25),

                // Mobile number filled
                  SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: registrationController.mobile_controller,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xff9e0093))),
                          labelText: "Mobile Number",
                          hintText: "Enter your Mobile Number",
                          prefixIcon: Icon(Icons.call)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //full name filled
                  SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: registrationController.full_nameController,
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

                  // email filled
                  SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: registrationController.email_Controller,
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

                  // password filled
                  SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: registrationController.password_Controller,
                      decoration: InputDecoration(
                          fillColor: Colors.white,

                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xff9e0093))),
                          labelText: "Password",
                          hintText: "Enter strong password",
                          prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  DropDownList(
                    controller: registrationController.gender_Controller,
                    hintText: 'Gender',
                    items: gender_list,
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),
                  // forgot password?

                  const SizedBox(height: 25),


                  Container(
                    height: 60,
                    width: 400,
                    child: ElevatedButton(

                        onPressed: (){
                          if(!registrationController.validation()){
                            return;
                          }
                          FirebaseHandler auth=new FirebaseHandler();
                          UserModel usermodel=registrationController.getUserData();
                          auth.CreateUserUsingEmail(
                                  (error){
                                    if(!error){
                                      registerToast();

                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen()));
                                    }

                                    }, usermodel, false);

                        },

                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyAppColor.primary_color,

                            shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.all(Radius.circular(5)))),
                        child: Text("Sign In",
                          style: GoogleFonts.openSans(
                              color: Colors.white
                          ),)),
                  ),

                  const SizedBox(height: 50),

                ],
              ),
            ),
          ),
        ),

    );
  }

  void registerToast() {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hii, there!',
        message: 'Register Successfully',
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}
