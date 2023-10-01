import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hospital_app/helpmaterial.dart';

class apiprofile extends StatelessWidget {
  String name, Image, category_pro;
  apiprofile({super.key,
  required this.name,
  required this.Image,
  required this.category_pro,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
             minimum: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
             child: Column(children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(Image)),
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(100),
                                
                              ),
                              
                              ),

                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius:BorderRadius.only(
                                  topLeft: Radius.circular(20), 
                                  bottomRight: Radius.circular(20)),
                                ),
                                child: Center(child: Text("rating", style: TextStyle(color: Colors.white),)),
                              ), 
                               ], ),
                          ],
              ),
               Divider(
                height: 10,
                color: Colors.transparent,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                  SizedBox(height: 40,),
                  SizedBox(width: 20,),
                    Title(color: Colors.black, child: Text("Product Name: ${name}",style: TextStyle(fontSize: 15),),),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black,
              ),
              Row(
                children: [
                SizedBox(height: 30,),
                SizedBox(width: 20,),
                  Title(color: Colors.black, child: Text("Product id: id",style: TextStyle(fontSize: 15),),),
                ],
              ),
              Divider(
                height: 10,
                color: Colors.black,
              ),
              Row(
                children: [
                SizedBox(height: 30,),
                SizedBox(width: 20,),
                  Title(color: Colors.black, child: Text("Product Price: price",style: TextStyle(fontSize: 15),),),
                ],
              ),
              Divider(
                height: 10,
                color: Colors.black,
              ),
              Row(
                children: [
                SizedBox(height: 30,),
                SizedBox(width: 20,),
                  Title(color: Colors.black, child: Text("Product Category: ${category_pro}",style: TextStyle(fontSize: 15),),),
                ],
              ),
             ]),
          )
          ),
    ));
  }
}
