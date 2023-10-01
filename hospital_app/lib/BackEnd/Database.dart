import 'dart:convert';

import 'package:get/get.dart';
import 'package:hospital_app/thirdpage.dart';
import 'LocalDataBase.dart';
import 'package:hospital_app/commonDialog.dart';
import 'package:hospital_app/firstpage.dart';
// import 'package:hospital_batch6/BackEnd/LocalDataBase.dart';
// import 'package:hospital_batch6/pages/home_doctor.dart';
// import 'package:hospital_batch6/signup/login_page.dart';
// import '../CoreUI/commonDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
// import 'package:hospital_app/home_doctor.dart';
import 'package:http/http.dart' as http;

class DataBase extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _storeData = FirebaseFirestore.instance;
  LocalDatabase _localdataBase = LocalDatabase();

  String dummyImage =
      "https://img.freepik.com/premium-vector/vector-icon-doctor-image-female-doctor-with-stethoscope-medical-uniform-gauze-protective_619989-707.jpg?w=740";
////////////////////////////////Sign up code////////////////////////
  Future signUp({
    required String email,
    required String password,
    required String Spec,
    // required String imageurl,
    required String name,
    required String phone,
    required String time,
    required String hospital,
  }) async {
    try {
      CommonDialog.showDialog();
      print("Inside the signUp");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      print(userCredential);

      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        // final uid = userCredential.user!.uid;
        await _storeData
            .collection('App_Users_credentials')
            .doc(userCredential.user!.uid)
            .set({
          'user_Id': userCredential.user!.uid,
          'Dr_name': name,
          'password': password,
          'email': email,
          'Spec': Spec,
          'Time': time,
          'Image_url': "image data",
          'Phone': phone,
          "Hospital_Loc": hospital,
        });

        CommonDialog.hideLoading();

        Get.offAll(loginform());
  /////////////////now the catch starts/////////////
      } on FirebaseAuthException catch (e) {
  //////////////// catches error on "e" //////////////
        CommonDialog.hideLoading();
        if (e.code == 'weak-password') {
          CommonDialog.showErrorDialog(
              title: "weak Password",
              description: "The password provided is too weak.");
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          CommonDialog.showErrorDialog(
              title: "Email Exists",
              description:
                  "An existing account is already registered with that email address.");
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(
          description: "Something went wrong", title: e.toString());
    }
  }

  ////////////////Sign In ends/////////////////////
  Future<void> loginFun({String? email, String? password}) async {
    try {
      CommonDialog.showDialog();
      UserCredential Credential = await _auth.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!.trim(),
      );

      await _localdataBase.setAppUserRecord(
          useremail: email,
          userid: Credential.user!.uid.toString(),
          islogin: true);

      CommonDialog.hideLoading();

      Get.offAll(dashbord());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            title: "Login Failed",
            description:
                "Your email or password is incorrect.\nPlease try again.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            title: "Login Failed",
            description:
                "Your email or password is incorrect.\nPlease try again.");
        print('Wrong password provided for that user.');
      }
    }
  }

  //////////////////////add doctor starts//////////////////////////

  AddDoctor(
      {String? name,
      email,
      exp,
      spec,
      hosName,
      phoneNum,
      stTime,
      enTime}) async {
    CommonDialog.showDialog(title: "Adding Doctor data");
    await _storeData
        .collection("DoctorInfo")
        .doc(DateTime.now().toString())
        .set({
      "Doctorname": name,
      "DocEamil": name,
      "DocExp": exp,
      "DocSpec": spec,
      "HospitalName": hosName,
      "PhoneNumber": phoneNum,
      "stTime": stTime,
      "enTime": enTime,
      "proImage": dummyImage,
    });

    CommonDialog.hideLoading();

    Get.back();
  }
////////////////////Patient Report////////////////
PatReport(
      {String? name,
      cstatus,
      pstatus,
      hosName,
      details,
      phoneNum,
      }) async {
    CommonDialog.showDialog(title: "Adding Patient Report");
    await _storeData
        .collection("PatientReport").doc(DateTime.now().toString()).set({
      "PatientName": name,
      "CurrentStatus": cstatus,
      "PreviousStatus": pstatus,
      "HospitalName": hosName,
      "DoctorPhoneNumber": phoneNum,
      "Details": details,
      "proImage": dummyImage,
    });
    CommonDialog.hideLoading();
    Get.back();
  }
  // get_api() {}
//////////////////////Api's///////////////////////
Future get_api() async {
    String url = "https://fakestoreapi.com/products";

    final all_product = Uri.parse(url);

    final response = await http.get(all_product);

    final allbody = response.body;
    print("response code is here ==>${response.statusCode}");

    print("the response is body ==>${response.body}");

    return json.decode(allbody);
  }  
}


  