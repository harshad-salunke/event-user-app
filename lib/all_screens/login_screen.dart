
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:event_booking_application/FirebaseDAO/FirebaseHandler.dart';
import 'package:event_booking_application/all_screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import '../utils/app_colors.dart';
import 'register_page.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
 late TextEditingController emailController=TextEditingController();
  late TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text("Pune City Events",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                    
                ),),
                SizedBox(
                  height: 40,
                ),
            
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,

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
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
            
                  child: ElevatedButton(
                  
                      onPressed: () {

                        if(isvalidate()){
                          FirebaseHandler firebase=FirebaseHandler();
                          // firebase.startProgress(context);
                          firebase.signInWithEmailAndPassword(emailController.text, passwordController.text,(islogin,text){
                            if(islogin){
                              print(islogin);
                              loginToast();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                            }else{
                              wrongToast(text);
                            }
                          });

                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyAppColor.primary_color,
                  
                          shape: RoundedRectangleBorder(
                  
                              borderRadius: BorderRadius.all(Radius.circular(5)))),
                      child: Text("Login",
                        style: GoogleFonts.openSans(
                            color: Colors.white
                        ),)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Navigator. push(context, MaterialPageRoute(builder: (BuildContext context){ return RegisterScreen(); }));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Image(
                    image: AssetImage("assets/images/pune_banner.jpg"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isvalidate(){
    String email=emailController.text.toString();
    String password=passwordController.text.toString();
    print(email);
    print(password);

    if(!email.endsWith("@gmail.com") ){
      Toast.show("Please Enter Correct Email", duration: Toast.lengthShort, gravity:  Toast.bottom);
      return false;
    }
    if( password.length<6 ){
      Toast.show("Please Enter Correct Password", duration: Toast.lengthShort, gravity:  Toast.bottom);
      return false;
    }

    return true;
  }
 void loginToast() {
   final snackBar = SnackBar(
     elevation: 0,
     behavior: SnackBarBehavior.floating,
     backgroundColor: Colors.transparent,
     content: AwesomeSnackbarContent(
       title: 'Hii, there !',
       message: 'Wellcome Back',
       contentType: ContentType.success,
     ),
   );
   ScaffoldMessenger.of(context)
     ..hideCurrentSnackBar()
     ..showSnackBar(snackBar);
 }

 void wrongToast(String msg) {
   final snackBar = SnackBar(
     elevation: 0,
     behavior: SnackBarBehavior.floating,
     backgroundColor: Colors.transparent,
     content: AwesomeSnackbarContent(
       title: 'Wrong, Details !',
       message: msg,
       contentType: ContentType.failure,
     ),
   );
   ScaffoldMessenger.of(context)
     ..hideCurrentSnackBar()
     ..showSnackBar(snackBar);
 }



}
