import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/CoreUI/apiprofile.dart';
// import 'package:hospital_app/BackEnd/Database.dart';
import 'package:hospital_app/CoreUI/splashscreen.dart';
import 'package:hospital_app/firstpage.dart';
import 'package:hospital_app/newsigninpage.dart';
import 'package:hospital_app/thirdpage.dart';
import 'package:hospital_app/formodel';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../BackEnd/Database.dart';





class doclist extends StatelessWidget {
   doclist({super.key});

  DataBase apiService = Get.put(DataBase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
             minimum: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
           
            child: Column(
              children: [
///////////////////////////Sir's code Starts//////////////////////////////                
                SizedBox(
              height: 560,
              child: FutureBuilder(
                  future: apiService.get_api(),
                  builder: (context, AsyncSnapshot snapshot) {
                    
                    if (snapshot.hasData) {
                      log("here is the length ${snapshot.data.length}");
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            dynamic data = snapshot.data[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  data["image"],
                                ),
                              ),
                              title: Text("${data["category"]}"),
                              subtitle: Text("${data["title"]}"),
                              onTap:
                              (){
                                Get.to(
                                  apiprofile(Image: data["image"], category_pro: data["category"], name: data["title"],)
                                  );
                              }
                              
                            );
                          }
                          // onTap(){

                          // }
                          );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
///////////////////////////Sir's code Ends//////////////////////////////
                // InkWell(
                //   child: Container(
                //     height: 100,
                //     width: 320,
                //     // color: Colors.amber,
                //     decoration: BoxDecoration(
                //       color: Colors.grey,
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(top: 11, left: 10),
                //       child: Column(children: [
                //         Align(
                //           alignment: Alignment.centerLeft,
                //           child: Container(
                //             height: 80,
                //             width: 80,
                //             decoration: BoxDecoration(
                //               color: Colors.blueGrey,
                //               borderRadius: BorderRadius.circular(90)
                //             ),
                //           ),
                //         ),
                //         // Title(color: Colors.white, child: Text("Doctor Name")),         
                //       ]),
                //     ),
                //   ),
                //   // onTap: () {
                    
                //   // },
                // ),
              ],
            ),  
            ),
        ),
      ),
    );
  }
}