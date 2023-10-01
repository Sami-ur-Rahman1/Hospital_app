import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_app/BackEnd/Database.dart';
import 'package:hospital_app/CoreUI/listdata.dart';
import 'package:hospital_app/thirdpage.dart';
import '../helpmaterial.dart';
import 'commonwidget.dart';
import 'commonwidget.dart';

String? conname,conemail,conspec,conhospi,constime,conetime;
class dcoform extends StatelessWidget {
       dcoform({super.key});
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Experiencecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController specilizationcontroller = TextEditingController();
  TextEditingController hospitalcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController stimecontroller = TextEditingController();
  TextEditingController etimecontroller = TextEditingController();
  
  final formkey = GlobalKey<FormState>();

DataBase adddoctor = Get.put(DataBase());

  String? emaildata;
/////////////////fun gets the values////////////////
 Adddoctor() async {
    await adddoctor.AddDoctor(
      email: emaildata,
      name: namecontroller.text,
      enTime: etimecontroller.text,
      stTime: stimecontroller.text,
      exp: Experiencecontroller.text,
      hosName: hospitalcontroller.text,
      phoneNum: phonecontroller.text,
      spec: specilizationcontroller.text,
    );
  }
///////////////////////fun end/////////////////////
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                 minimum: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                child: Form(
                  key: formkey,
                  child: Container(
                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(colors: [
                                Color(hexColor('#c9f0ea')),
                                Color(hexColor('#b1f0e6')),
                                Color(hexColor('#8bc7be')),
                                Color(hexColor('#7daba4')),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft
                              )
                              ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 300,
                            child: Center(child: Text("Add Image Here",style: Theme.of(context).textTheme.headline5)),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
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
                             keyboardtype: TextInputType.text,
                            controller: Experiencecontroller,
                            hintText: "Experience",Validation: (value){
                              if(value!.isEmpty || value == null){
                                return "Please Enter your Experience";
                              }
                              else{
                                Experiencecontroller.text;
                                log("${Experiencecontroller.text}");
                              }
                          },
                          ),
                          fixsizeheight12,
                          commontextfield(
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
                          fixsizeheight12,
                          commontextfield(
                            hintText: "Phone No", 
                            Validation: (value) {
                            if(value!.isEmpty || value == null) {
                              return "Enter Your Phone No";
                            }
                            else
                            {phonecontroller.text;
                              log("${phonecontroller.text}");
                            }
                          }, controller: phonecontroller,
                           keyboardtype: TextInputType.phone
                          ),
                          fixsizeheight12,
                          /////////////////time text fields/////////////////
                          Row(
                            children: [
                              Flexible(child: commontextfield(
                            hintText: "Time", 
                            Validation: (value) {
                            if(value!.isEmpty || value == null) {
                              return "Starting time";
                            }
                            else
                            {stimecontroller.text;
                              log("${stimecontroller.text}");
                            }
                          }, controller: stimecontroller,
                           keyboardtype: TextInputType.phone)
                           ),
                           fixsizewidth12,
                           //////////////////second part//////////////////////////
                            Flexible(child: commontextfield(
                            hintText: "Time", 
                            Validation: (value) {
                            if(value!.isEmpty || value == null) {
                              return "Ending time";
                            }
                            else
                            {etimecontroller.text;
                              log("${etimecontroller.text}");
                            }
                          }, controller: etimecontroller,
                           keyboardtype: TextInputType.phone)
                           ),
                           
                            ],
                          ),
                          fixsizeheight12,
                          fixsizeheight12,
////////////////////////////Submit Button///////////////////////                          
                          InkWell(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 40,
                                width: 100,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                 color: Colors.green[600]),
                                 child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),))
                              ),
                            ),
                            // onTap: (){
                            //   if(formkey.currentState!.validate()){
                            //     conname = namecontroller.value.text;
                            //     conemail = emailcontroller.value.text;
                            //     conspec = specilizationcontroller.value.text;
                            //     conhospi = hospitalcontroller.value.text;
                            //     constime = stimecontroller.value.text;
                            //     conetime = etimecontroller.value.text;
                            //     print(conname);
                            //     print(conemail);
                            //     print(conspec);
                            //     print(conhospi);
                            //     print(constime);
                            //     print(conetime);
                            //     log("all est textfield data");
                            //     // Navigator.pushNamed(context, "mainpage");
                            //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> dashbord()));
                            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> condata()));
                            //   }
                            // },
                              onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    Adddoctor();
                                  }
                                },
                          ),
                          fixsizeheight12,
                          fixsizeheight12,
                            
                        ],
                      ),
                    ),
                  ),
                  
                )
              ),              
            ],
          ),
        )
    
      ),
    );
  }
}

