import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hospital_app/CoreUI/patientreport.dart';
import 'package:hospital_app/helpmaterial.dart';
import 'package:hospital_app/home_doctor.dart';

class docDetails extends StatelessWidget {
   String docname, specilization, experiences,stime,etime,number;
  docDetails({super.key,
  required this.docname,
  required this.specilization,
  required this.experiences,
  required this.stime,
  required this.etime,
  required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 238, 238),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => doctor_home()));
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Doctor Profile",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        fixsizewidth12,
                        fixsizewidth12,
                        fixsizewidth12,
                        fixsizewidth12,
                        InkWell(
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Appointment",style: TextStyle(fontSize: 14),),
                            ),
                          ),
                          onTap: () {
                            Get.to(patreport(phoneno: number,));
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                        ///////////////////////////////image//////////////////////////////////////                            
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 10),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                      image: AssetImage("assets/Images/doc1.png")),
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Row(),
                        ///////////////////////////////Doctor Name//////////////////////////////////////                                 
                                  SizedBox( height: 30,),                               
                                  Text( "Doctor Name: ${docname}",style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),),
                        ///////////////////////////////Doc Details//////////////////////////////////////                                
                                  SizedBox(height: 10,),
                                  Text("Specilization: ${specilization}",style: TextStyle(fontSize: 14),),
                                  SizedBox(height: 10,),
                                  Text("Phone NO: ${number}",style: TextStyle(fontSize: 14),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox( height: 20,),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white60,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100))),
                        child: Column(
                          children: [
                           fixsizeheight12,
                           fixsizeheight12,
                           fixsizeheight12,
///////////////////////////////About Doctor//////////////////////////////////////                            
                            Text("About",style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Text("A Dentist, or Dental Surgeon, is responsible for performing oral surgery and routine cleanings on patients. Their duties include repairing and removing teeth, diagnosing conditions and communicating with patients about how to best care for their teeth and gums"),
                            ),
                            Text( "readmore..", style: TextStyle(color: Colors.orange),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 300, left: 20),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 10,
///////////////////////////////Changes the position of Shadow////////////////////////////////////// 
                                      offset: Offset(0, 3), ),
                                  ],
                                  color: Colors.orange.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
///////////////////////////////Number of Patients//////////////////////////////////////                                     
                                    Text( "Patient", style: TextStyle( fontSize: 18,),),
                                    fixsizeheight12,
                                    Text("10K",style: TextStyle(fontSize: 15,),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 300, left: 20),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.blue.shade200,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
///////////////////////////////Doctor's Experiences//////////////////////////////////////                                     
                                    Text( "Expe", style: TextStyle(fontSize: 18,),),
                                    fixsizeheight12,
                                    Text("${experiences}",style: TextStyle(fontSize: 15,),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 300, left: 20),
                            child: Container(
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.red.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
///////////////////////////////Doctor's Rating//////////////////////////////////////                                      
                                      Text("Rating",style: TextStyle(fontSize: 18,),),
                                      fixsizeheight12,
                                      Text("4.5",style: TextStyle(fontSize: 20,),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 400, left: 20),
                            child: Container(
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.red.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
///////////////////////////////Doctor's Starting Timing//////////////////////////////////////                                      
                                      Text("Starting Time", style: TextStyle(fontSize: 18,),),
                                      fixsizeheight12,
                                      Text("${stime}",style: TextStyle(fontSize: 20,),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 400, left: 20),
                            child: Container(
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
///////////////////////////////Doctor's Ending Timing//////////////////////////////////////                                      
                                      Text("Ending Time",style: TextStyle(fontSize: 18,),),
                                      fixsizeheight12,
                                      Text("${etime}",style: TextStyle(fontSize: 20,),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  fixsizeheight12,
                  fixsizeheight12,
                ],
              ),
            )));
  }
}