import 'package:flutter/material.dart';
import 'package:hospital_app/CoreUI/adddoc.dart';
import 'package:hospital_app/firstpage.dart';
import 'secondpage.dart';
import 'package:hospital_app/formodel';
import 'CoreUI/doctorlist.dart';




class dashbord extends StatelessWidget {
       dashbord({super.key});
      //  required this.name, required this.email,

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [IconButton(onPressed: (){
             Navigator.pushNamed(context,"addDoc");
        }, icon: Icon(Icons.add))], ),
        body: SafeArea(
           minimum: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
////////////////////////////container one////////////////////////////                
                 InkWell(
                   child: Container(
                    height: 245,
                    width: 345,
                    decoration: BoxDecoration(                       
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Flexible(child: Row(
                          children: [
                            Container(
                              height: 122,
                              width: 330,
                              color: Colors.white70,
                            )
                          ],
                        ),),
                        Divider(color: Colors.black87),
                        Flexible(
                          child: Row(
                          children: [
                            Container(
                              height: 122,
                              width: 330,
                              color: Colors.white70,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 11, left: 15),
                                child: Column(
                                  children: [
                        //             Text("Doctor Name: ${conname!}"),
                        //             Text("Email: ${conemail!}"),
                        //             Text("Specilization: ${conspec!}"),
                        //             Text("Hospital: ${conhospi!}"),
                        // Row(
                        //   children: [
                        //     Text("Starting time: ${constime!}"),
                        //     Text("Ending time: ${conetime!}"),
                        //   ],
                        // )
            //                         Expanded(
            //                           child: GridView.builder(
            //  itemCount: all_data.length,
            //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 3,
            //   crossAxisSpacing: 10,
            //   childAspectRatio: 0.7,
            //   mainAxisSpacing: 10,
            //   ),                    
            //         itemBuilder: ((contextx , index) 
            //         {
  
            //         //    child: Container(
            //         //     decoration: BoxDecoration(
            //         //         color: all_data[index].colors,
            //         //         image: DecorationImage(
            //         //             fit: BoxFit.fitHeight,
            //         //             image: AssetImage(
            //         //                 "assets/Images/${all_data[index].images}"))
            //         //                 ),
                                    
            //         //                    child: Center(
            //         //                      child: Padding(
            //         //     padding: const EdgeInsets.only(top: 90),
            //         //     child: Text(
            //         //     all_data[index].names,
            //         //      style: TextStyle(
                                
            //         //             fontSize: 30,
            //         //             color: Colors.white,
            //         //             fontWeight: FontWeight.bold),
            //         //                    ),
            //         //                      )
            //         //                    ),
            //         //                 )
                      
                      
            //         }
            //         )
            //         ),
            //                         ),
                                    
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),),
                      ],
                    ),
                   ),
                   onTap: ()
                        {  Navigator.pushNamed(context, "doctorslist"); },
                 ),
////////////////////////////container two////////////////////////////                 
                 SizedBox(height: 15),
                 InkWell(
                   child: Container(
                    height: 245,
                    width: 345,
                    decoration: BoxDecoration(
                       
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                                  alignment: Alignment.center,
                                    child: CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                           AssetImage("assets/Images/doc2.png"),
                                        ),
                                    ),
                                ),
                    ),
                   ),
                    onTap: ()
                        {  Navigator.pushNamed(context, "doctorslist"); },
                 ),
////////////////////////////container three////////////////////////////                 
                 SizedBox(height: 15),
                 InkWell(
                   child: Container(
                    height: 245,
                    width: 345,
                    decoration: BoxDecoration(
                       
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                                  alignment: Alignment.center,
                                    child: CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                           AssetImage("assets/Images/doc3.png"),
                                        ),
                                    ),
                                ),
                    ),
                   ),
                    onTap: ()
                        {  Navigator.pushNamed(context, "doctorslist"); },
                 ),
////////////////////////////container ends////////////////////////////                 
                 SizedBox(height: 15), 
                  ],
            ),
          ),
        ),
///////////////////////////////////floating button////////////////////
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        //    floatingActionButton: FloatingActionButton(
        //       child: const Icon(Icons.add),
        //       onPressed: () {
        //           Navigator.pushNamed(context,"addDoc");
        //       } ,
        //       elevation: 50,     
        //  ),    
      ),
    );
  }
}