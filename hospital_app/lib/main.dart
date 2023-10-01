import 'package:flutter/material.dart';
import 'package:hospital_app/CatDoctorDetails.dart';
import 'package:hospital_app/CoreUI/adddoc.dart';
import 'package:hospital_app/CoreUI/apiprofile.dart';
import 'package:hospital_app/CoreUI/docprofile.dart';
import 'package:hospital_app/CoreUI/listdata.dart';
import 'package:hospital_app/CoreUI/splashscreen.dart';
import 'package:hospital_app/DrCategoryScreen.dart';
import 'package:hospital_app/ShowAllDoc.dart';
import 'package:hospital_app/firstpage.dart';
import 'package:hospital_app/home_doctor.dart';
import 'package:hospital_app/newsigninpage.dart';
import 'package:hospital_app/thirdpage.dart';
import 'secondpage.dart';
import 'package:hospital_app/formodel';
import 'package:firebase_core/firebase_core.dart';
import 'newsigninpage.dart';
import 'CoreUI/commonwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'CoreUI/doctorlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_app/commonDialog.dart';
import 'package:image_picker/image_picker.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'main',
      routes: {
         "/": (context) => loginform(),
         "splashscreen": (context) => splahsscreen(),
         //////////old sign in form/////////
         "Signin": (context) => signinform(),
         ////////new sign form//////////////
         "new": (context) => newsigninform(),
/////////////////new dashbord//////////////////////
         "main": (context) => doctor_home(),
/////////////////old dashbord//////////////////////
         "mainpage": (context) => dashbord(),
        //  "dashbord": (context) => doctor_home(),        
         "doctorslist": (context) => doclist(),
         "addDoc": (context) => dcoform(),
         "adddoctorlist": (context) => condata(),
         "drcategory": (context) => DrCategoryScreen(),
         "Alldoc": (context) => ShowAllDoc(),
        //  "DoctorProfile": (context) => docDetails(),

        //  "Apidataprofile": (context) => apiprofile(),

      },

      //home : signinform(),
      // loginform(),
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
    );
  }
}

