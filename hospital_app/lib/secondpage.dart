import 'package:flutter/material.dart';

class signinform extends StatefulWidget {
  const signinform({super.key});

  @override
  State<signinform> createState() => _signinformState();
}

class _signinformState extends State<signinform> {
  bool passhid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In', style: Theme.of(context).textTheme.headline3,),
          TextField(
            decoration: InputDecoration(hintText: 'Email',
            suffixIcon: Icon(Icons.email)),
          ),
          TextField(
            obscureText: passhid,
            decoration: InputDecoration(hintText: 'Password',
            suffixIcon: InkWell(
              onTap: _togglePasswordView,
              child: Icon(Icons.visibility,
              ),
            ) ),
          ),
          TextField(
             keyboardType: TextInputType.number, 
            decoration: InputDecoration(hintText: 'Phone Number',
            suffixIcon: Icon(Icons.email)),
          ),
          
          SizedBox(height: 30),
              InkWell(
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor),
                  child: Center(child: Text("Done",style: TextStyle(color: Colors.white),)),

                ),
                 onTap: ()
                        {  Navigator.pushNamed(context, "new"); },
              ),
            ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    passhid = !passhid;
    setState(() {
    
    });
  }
}