import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hospital_app/BackEnd/Database.dart';
import 'package:hospital_app/CoreUI/commonwidget.dart';
// import 'package:hospital_app/CoreUI/uploadpic.dart';
import 'package:hospital_app/commonDialog.dart';
import 'package:hospital_app/helpmaterial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class patreport extends StatefulWidget {

String phoneno;

  patreport({super.key,
  required this.phoneno,
  });

  @override
  State<patreport> createState() => _patreportState();
}

class _patreportState extends State<patreport> {

ImagePicker imagePicker = ImagePicker();
  String? imageurl;
  File? imagedata;

  getImage(
    ImageSource imageSource,
  ) async {
    final img = await imagePicker.pickImage(source: imageSource);
    if (img != null) {
      imagedata = File(img.path);
      log("image data $imagedata");
      log("image url before $imageurl");

      log("image data ${imagedata!.path}");
      //

      await uploadImages();

      log("image url after $imageurl");
    }
  }

  final FirebaseStorage storage = FirebaseStorage.instance;
  uploadImages() async {
    CommonDialog.showDialog();

    try {
      final ref = storage
          .ref()
          .child("P_Report/${DateTime.now().microsecondsSinceEpoch}");
      //Upload the file to firebase
      final uploadTask = await ref.putFile(File(imagedata!.path));

      imageurl = await uploadTask.ref.getDownloadURL();

      setState(() async {
        imageurl = await uploadTask.ref.getDownloadURL();
      });

      print("before assign url $imageurl");

      CommonDialog.hideLoading();

      // Imageurl.text = imageurl!;
      log("profileurl>>>>>>>>>>>>>>>>>>>>>$imageurl");

           // log("Model>>>>>>>>>>>>>>>>>>>>>${Imageurl.text}");
    } catch (e) {
      log(e.toString());
    }
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController cstatuscontroller = TextEditingController();
  TextEditingController pstatuscontroller = TextEditingController();
  TextEditingController hospitalcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController detailscontroller = TextEditingController();

 final formkey = GlobalKey<FormState>();

DataBase Patreport = Get.put(DataBase());

/////////////////fun gets the values////////////////
 PatReport() async {
    await Patreport.PatReport(
      name: namecontroller.text,
      cstatus:cstatuscontroller.text,
      pstatus: pstatuscontroller.text,
      hosName: hospitalcontroller.text,
      details: detailscontroller.text,
      phoneNum: widget.phoneno,
    );
  }

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
                                  fixsizeheight12,
                                  fixsizeheight12,
                                  Container(
                                    height: 150,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
        ///////////////////////////////////defult pic//////////////////////////////
                         image: imageurl == null
                        ? DecorationImage(image: AssetImage("assets/Images/doc2.png"))
                        : DecorationImage(
                            image: MemoryImage(imagedata!.readAsBytesSync()))
                                    ),
                                    child: ElevatedButton(
                                      child: Text("Add image"),
                                      onPressed: () async {
                                        showDialog(context: context, 
                                        builder: (context){
                                          return Container(
                                            child: AlertDialog(
                                              title: Text("Select from"),
                                        actions: [
        /////////////////////////////////Button 2///////////////////////////////////////                                  
                                          TextButton(onPressed: () async {
                                            await getImage(ImageSource.camera);}, 
                                          child: Text("Camera") ),
        /////////////////////////////////Button 2///////////////////////////////////////                                  
                                          TextButton(onPressed: () async {
                                            await getImage(ImageSource.gallery);
                                          }, 
                                          child: Text("Gallery")),
                                        ],
                                        ),
                                          );
                                          
                                        });
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                         prefs.clear();
                                      },
                                    ),
//////////////////////////////////////Text Fields////////////////////////////////////
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
                                    controller: cstatuscontroller,
                                    hintText: "Current Status",Validation: (value){
                                      if(value!.isEmpty || value == null){
                                        return "Please Enter Your Current Status";
                                      }
                                      else{
                                        cstatuscontroller.text;
                                        log("${cstatuscontroller.text}");
                                      }
                                  },
                                  ),
                                  fixsizeheight12,
                                  commontextfield(
                                    keyboardtype: TextInputType.text,
                                    controller: pstatuscontroller,
                                    hintText: "Previous Status",Validation: (value){
                                      if(value!.isEmpty || value == null){
                                        return "Please Enter your Previous Status";
                                      }
                                      else{
                                        pstatuscontroller.text;
                                        log("${pstatuscontroller.text}");
                                      }
                                  },
                                  ),
                                  fixsizeheight12,
                                  commontextfield(
                                    controller: hospitalcontroller,
                                    hintText: "Hospital Name",Validation: (value){
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
                                    controller: detailscontroller,
                                    hintText: "Details",Validation: (value){
                                      if(value!.isEmpty || value == null){
                                        return "Please Enter Your Details";
                                      }
                                      else{
                                        detailscontroller.text;
                                        log("${detailscontroller.text}");
                                      }
                                  },
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
                                      onTap: () {
                                          if (formkey.currentState!.validate()) {
                                            PatReport();
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