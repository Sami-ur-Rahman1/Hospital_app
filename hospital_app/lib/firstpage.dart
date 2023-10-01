import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hospital_app/CoreUI/commonwidget.dart';
import 'package:hospital_app/home_doctor.dart';
import 'package:hospital_app/newsigninpage.dart';
// import 'package:hospital_app/home_doctor.dart';
import 'package:hospital_app/thirdpage.dart';
import 'BackEnd/Database.dart';
import 'helpmaterial.dart';



//////////////////////Sir's Log In Class///////////////
class loginform extends StatefulWidget {
  loginform({super.key});

  @override
  State<loginform> createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  DataBase auth = Get.put(DataBase());

  late GoogleSignInAccount _userObjj;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  UserLogin() {
    auth.loginFun(
        email: emailcontroller.text, password: passwordcontroller.text);
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text('DOCTOR  APP')),
      backgroundColor: Color.fromARGB(255, 248, 242, 242),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //     child: Center(
              //   child: Container(
              //       height: 300,
              //       width: 300,
              //       child: Lottie.asset('image/ani.json')),
              // )),
              fixsizeheight12,
              Container(
                child: Text( "Log In", 
                style: Theme.of(context).textTheme.headline3,),
              ),
              fixsizeheight12,
              Container(height: 150,
              width: 150,
              color: Colors.amber,
              ),
              SizedBox(height: 30),
             
              commontextfield(
                  controller: emailcontroller,
                  hintText: "Email",
                  Validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid email";
                    } else {
                      emailcontroller.text;
                      log("${emailcontroller.text}");
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              commontextfield(
                  controller: passwordcontroller,
                  hintText: "Password",
                  Validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid password";
                    } else {
                      passwordcontroller.text;
                      log("${passwordcontroller.text}");
                    }
                  }),
              SizedBox(
                height: 20,
              ),
             Row(
              children: [
                SizedBox( width: 20),
                SizedBox( width: 20),
//////////////////////Sign Up Button Starts///////////////////              
              Flexible(
                child: InkWell(
                  onTap: () {
                    Get.to(newsigninform());
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ),
              ),
//////////////////////Sign Up Button Ends///////////////////              
              SizedBox( width: 20),
              SizedBox( width: 20),
              SizedBox( width: 20),
//////////////////////Log In Button Starts///////////////////              
              Flexible(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.purple),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        Get.to(doctor_home());
              
                        // await UserLogin();
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
              ),
//////////////////////Log In Button Ends///////////////////     
              ],
             ),
             fixsizeheight12,
             fixsizeheight12,
///////////////////////Sign In With Google//////////////////             
            Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () async {
                    await _googleSignIn.signIn().then((userData) {
                      log("inside then");
                      _userObjj = userData!;

                      setState(() {
                        // _isLoggedIn = true;
                        print("on3");
                        print("My google data $_userObjj");
                      });
                      print("atiq data $_userObjj");
                      String docid, email, name, photo;
                      docid = _userObjj.id.toString();
                      email = _userObjj.email;
                      photo = _userObjj.photoUrl.toString();
                      name = _userObjj.displayName.toString();

                      log("this is  id $docid");
                      log("this is  id $email");
                      log("this is  id $name");
                      log("this is  id $photo");

                      Get.to(doctor_home());
                      // controller.GoolgeSign(
                      //   docid: docid,
                      //   email: email,
                      //   Name: name,
                      // );
                    }).catchError((e) {
                      print(e);
                    });
                  },
                  child: Text("Google SIGN UP"),
                ),
              ),
///////////////////////Sign In With Google//////////////////            
             fixsizeheight12,
             fixsizeheight12,
              InkWell(
                onLongPress: () {},
                child: Text(
                  "forget password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              fixsizeheight12,
              Text("Does not have account?"),
              fixsizeheight12,
// //////////////////////Sign Up Button Starts///////////////////              
//               InkWell(
//                 onTap: () {
//                   Get.to(newsigninform());
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.green),
//                   child: Center(
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700,),
//                     ),
//                   ),
//                 ),
//               ),
// //////////////////////Sign Up Button Ends///////////////////              
//               SizedBox(
//                 height: 20,
//               ),
// //////////////////////Log In Button Starts///////////////////              
//               Container(
//                 height: 50,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.purple),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (formkey.currentState!.validate()) {
//                       // log("all set textfeild data enter");

//                       await UserLogin();
//                     }
//                   },
//                   child: Text("Login"),
//                 ),
//               ),
// //////////////////////Log In Button Ends///////////////////              
              fixsizeheight12,
              fixsizeheight12,
            ],
          ),
        ),
      ),
    );
  }
}

