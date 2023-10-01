import 'package:flutter/material.dart';
import 'package:hospital_app/helpmaterial.dart';


class splahsscreen extends StatefulWidget {
  const splahsscreen({super.key});

  @override
  State<splahsscreen> createState() => _splahsscreenState();
}

class _splahsscreenState extends State<splahsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                          child: Center(
                            child: Container(
                              height: 300,
                              width: 400,
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     // fit: BoxFit.cover,
                              //     image: AssetImage("assets/Images/doc2.png")
                              //     )
                              // ),
                            )
                          ),

          )
        ],
      ),
    );
  }
}