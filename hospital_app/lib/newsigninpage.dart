import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_app/thirdpage.dart';
import 'CoreUI/commonwidget.dart';
import 'helpmaterial.dart';
import 'BackEnd/Database.dart';






class newsigninform extends StatelessWidget {
       newsigninform({super.key});
       FirebaseAuth _auth = FirebaseAuth.instance;
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController specilizationcontroller = TextEditingController();
  TextEditingController detailscontroller = TextEditingController();
  TextEditingController hospitalcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

  DataBase authdata = Get.put(DataBase()); 
////////////function for assigning controllers//////////////////
SignUp() {
    authdata.signUp(
        email: emailcontroller.text,
        password: passwordcontroller.text,
        Spec: specilizationcontroller.text,
        name: namecontroller.text,
        phone: timecontroller.text,
        time: timecontroller.text,
        hospital: hospitalcontroller.text);
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
             minimum: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Form(
              key: formkey,
              child: Container(
                decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                            Color(hexColor('#deeefa')),
                            Color(hexColor('#d2e9fc')),
                            Color(hexColor('#c5e3fc')),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft
                          )
                          ),
                // height: double.infinity,
                // width: 300,
                child: Column(
                  children: [
                    // padding: EdgeInsets.all(20.0),
                    Container(
                      height: 180,
                      width: 300,
                      child: Center(child: Text("Lotti image here",style: Theme.of(context).textTheme.headline5)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    fixsizeheight12,
                    fixsizeheight12,
                    fixsizeheight12,
                    commontextfield(
                      
                      controller: namecontroller,
                      hintText: "Name",Validation: (value)
                      {
                        if(value!.isEmpty || value == null){
                          return "Please Enter Your Name";
                        }
                        else{
                          namecontroller.text;
                          log("${namecontroller.text}");
                        }
                    },
                    ),
                    fixsizeheight12,
                    commontextfield(
                      keyboardtype: TextInputType.emailAddress,
                      controller: emailcontroller,
                      hintText: "Email",Validation: (value){
                        if(value!.isEmpty || value == null){
                          return "Please Enter an Email";
                        }
                        else{
                          emailcontroller.text;
                          log("${emailcontroller.text}");
                        }
                    },
                    ),
                    fixsizeheight12,
                    commontextfield(
                       keyboardtype: TextInputType.number,
                      controller: passwordcontroller,
                      hintText: "Password",Validation: (value){
                        if(value!.isEmpty || value == null){
                          return "Please Enter your Password";
                        }
                        else{
                          passwordcontroller.text;
                          log("${passwordcontroller.text}");
                        }
                    },
                    ),
                    fixsizeheight12,
                    commontextfield(
                      // keyboardType: TextInputType.text,
                      controller: specilizationcontroller,
                      hintText: "Specilization",Validation: (value){
                        if(value!.isEmpty || value == null){
                          return "Please Enter Your Specilization";
                        }
                        else{
                          specilizationcontroller.text;
                          log("${specilizationcontroller.text}");
                        }
                    },
                    ),
                    fixsizeheight12,
                    commontextfield(
                      // keyboardType: TextInputType.text,
                      controller: detailscontroller,
                      hintText: "Details",Validation: (value){
                        if(value!.isEmpty || value == null){
                          return "Please Enter Your Bio";
                        }
                        else{
                          detailscontroller.text;
                          log("${detailscontroller.text}");
                        }
                    },
                    ),
                    fixsizeheight12,
                    commontextfield(
                      // keyboardType: TextInputType.text,
                      controller: hospitalcontroller,
                      hintText: "Hospitalname",Validation: (value){
                        if(value!.isEmpty || value == null){
                          return "Please Enter Your hospital name";
                        }
                        else{
                          hospitalcontroller.text;
                          log("${hospitalcontroller.text}");
                        }
                    },
                    ),
                    commontextfield(hintText: "Time", Validation: (value) {
                      if(value!.isEmpty || value == null) {
                        return "Enter Your Timings";
                      }
                      else
                      {
                        timecontroller.text;
                        log("${timecontroller.text}");
                      }

                    }, controller: timecontroller,
                     keyboardtype: TextInputType.phone
                    ),
                    fixsizeheight12,
                    Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          onPressed: (() async {
                            if (formkey.currentState!.validate()) {
                              await SignUp();
                            }
                          }),
                          child: Text("SIGN UP"),
                        ),
                      ),
                   fixsizeheight12,
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 100,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                         color: Colors.blue),
                         child: Center(child: Text("Done",style: TextStyle(color: Colors.white),))
                      ),
                      onTap: (){
                        if(formkey.currentState!.validate()){
                          log("all est textfield data");
                          _auth.createUserWithEmailAndPassword(email: emailcontroller.text.toString(), password: passwordcontroller.text.toString());
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>dashbord(name: namecontroller.text, email: emailcontroller.text)));
                          Navigator.pushNamed(context, "/");
                        }
                      },

                    )
                      
                  ],
                ),
              ),
            )
          ),
        )
    
      ),
    );
  }
}

