import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/UserModle.dart';


class RegistrationController{
  TextEditingController mobile_controller=TextEditingController();

  TextEditingController full_nameController=TextEditingController();
  TextEditingController email_Controller=TextEditingController();
  TextEditingController password_Controller=TextEditingController();
  TextEditingController gender_Controller=TextEditingController();

  bool validation(){

    if(mobile_controller.text=="" && mobile_controller.text.length<10 || mobile_controller.text.length>10){
      Fluttertoast.showToast(
          msg: "Please Enter Correct Mobile Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;

    }

    if(full_nameController.text=="" ){
      Fluttertoast.showToast(
          msg: "Please Enter Full Name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;

    }

    if(!email_Controller.text.endsWith("@gmail.com") ){
      Fluttertoast.showToast(
          msg: "Please Enter Correct Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;

    }

    if(password_Controller.text.length<6 ){
      Fluttertoast.showToast(
          msg: "Password at least 6 digits",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;

    }



    if(gender_Controller.text=="" ){
      Fluttertoast.showToast(
          msg: "Please Select Gender",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }

    return true;
  }

  UserModel getUserData(){
    return UserModel(phone_number: mobile_controller.text, name: full_nameController.text, uid: "", join_date: "", gender: gender_Controller.text, email: email_Controller.text, password: password_Controller.text);
  }

}