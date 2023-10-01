import 'package:flutter/material.dart';

  int hexColor(String c){
     String sColor = '0xff' + c;
     sColor = sColor.replaceAll('#','');
     int dColor = int.parse(sColor);
     return dColor;
  }

Color black_color = Colors.black;
Color pagecustomcolor = Colors.red.shade900;
Color othercolor = Colors.white;
Color bodyofapp = Colors.grey.shade700;
Color coloranother = Colors.green.shade900;

//   gradient: LinearGradient(colors: [
//                             Color(hexColor('#f2edee')),
//                             Color(hexColor('#dbd3d4')),
//                           ],


SizedBox fixsizewidth12 = const SizedBox(  width: 12.0, );
SizedBox fixsizeheight12 = const SizedBox(  height: 12.0, );

