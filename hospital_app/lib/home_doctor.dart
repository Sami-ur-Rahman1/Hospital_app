import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hospital_app/CoreUI/doctorlist.dart';
import 'BackEnd/LocalDataBase.dart';
import 'CoreUI/commonwidget.dart';
import 'CoreUI/adddoc.dart';
import 'package:hospital_app/DrCategoryScreen.dart';
import 'package:hospital_app/ShowAllDoc.dart';
import 'firstpage.dart';
import 'newsigninpage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';






class doctor_home extends StatelessWidget {
  doctor_home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('D O C T O R  A P P')),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(tabs:[
              Tab(icon: Icon(Icons.add,color: Colors.blue,),),
              Tab(icon: Icon(Icons.list,color: Colors.blue,),),
              Tab(icon: Icon(Icons.filter,color: Colors.blue,),),
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.amber,
                    child: Center(child: Text('1st TAB')),
                  ),
                  Container(
                    color: Colors.black87,
                    child: Center(child: Text('2nd TAB')),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(child: Text('3rd TAB')),
                  ),

                ])),
    ////////////////////add Doctor Button//////////////////          
                 spacebox(),
            Center(         
              child: MaterialButton(
                onPressed: () {
                  Get.to(dcoform());
                },
                child: Container(
                  height: 50,
                  width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      "Add Doctor",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            spacebox(),
    ////////////////////show Doctor Button//////////////////          
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(ShowAllDoc());
                },
                child: Container(
                  height: 50,
                  width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      "Show Doctor",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            spacebox(),
    ////////////////////Doctor Category Button//////////////////          
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(DrCategoryScreen());
                },
                child: Container(
                  height: 50,
                  width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      "Category Filter",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),         
            spacebox(),
    ////////////////////Log Out Button//////////////////           
            Center(
              child: MaterialButton(
                onPressed: () async {
//////////////////////For Log Out/////////////////////////
                    GoogleSignIn _googleSignIn = GoogleSignIn();
                    _googleSignIn.signOut();
/////////////////////Log Out////////////////////////////////                    
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Get.offAll(loginform());
                },
                child: Container(
                  height: 50,
                  width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
    ////////////////////Log Out Button Ends//////////////////  
//////////////////////////Api Button Starts/////////////////////////
    spacebox(),
          Center(
            child: MaterialButton(
              onPressed: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();

                // prefs.clear();
                Get.to(doclist());
              },
              child: Text(
                "ApiCall",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ), 
//////////////////////////Api Button Ends/////////////////////////                     
          ],
        ),
      )),
    );
  }
}
