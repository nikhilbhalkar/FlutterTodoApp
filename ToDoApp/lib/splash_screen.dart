import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class Splash_screen extends StatefulWidget{
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: '')));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: Text('NB',style: TextStyle(fontSize: 50,fontWeight:FontWeight.w700,color: Colors.black )),

          ),
        ),
      ),
    );
  }
}



