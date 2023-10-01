import 'package:flutter/material.dart';


class commontextfield extends StatelessWidget {
   commontextfield({
    required this.hintText,
    required this.Validation,
    required this.controller,
    this.keyboardtype = TextInputType.name,
    Key? key, 
  }) : super(key: key);

  String hintText;
  String? Function(String? val)? Validation;
  
     TextInputType keyboardtype ;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
          controller: controller,
          validator: Validation,
          obscureText: false,
          keyboardType:keyboardtype,

          decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white30,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          focusColor:Colors.grey,
            // suffixIcon: Icon(Icons.email)
            ),
          ),
    );
  }
}



class custombutton extends StatelessWidget {
  custombutton({
  this.onTap,
  this.borderRadius,
  this.buttonColor,
  this.textColor,
  required this.buttonText,

    Key? key,
  }) : super(key: key);

  VoidCallback? onTap;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 65,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
            color: Colors.green,
            spreadRadius: 1, 
            blurRadius: 8, 
            offset: Offset(3,3),),
            BoxShadow(
            color: Colors.white12,
            spreadRadius: 1, 
            blurRadius: 8, 
            offset: Offset(-3,-3),),              
             ],
        ),
        child: Center(
          child: Text(buttonText, style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),),
        ),
      ),
      onTap: onTap,
    );
  }
}


class spacebox extends StatelessWidget {
  const spacebox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
    );
  }
}


class common_listtile extends StatelessWidget {
  common_listtile({
    required this.subtitle,
    required this.title_text,
    Key? key,
  }) : super(key: key);
  String title_text, subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      tileColor: Colors.black54,
      textColor: Colors.white,
      iconColor: Colors.white,
      leading: const Icon(Icons.person),
      title: Text(title_text),
      subtitle: Text(subtitle),
      // onTap: () {
      //   // Get.to(doctor_home());
      // },
    );
  }
}