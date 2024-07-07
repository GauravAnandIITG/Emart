import 'dart:developer';

import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {

  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assests/3094352.jpg"),
              SizedBox(height:10,),
              Center(child: Text("Sign In", style: AppWidget.bolStyle(),)),
              Center(child: Text("Please Enter the details below to\n                       continue", style: AppWidget.lightStyle(),)),
              SizedBox(height:10,),
              Text("Email", style: AppWidget.semibolStyle(),),
              SizedBox(height:10,),
              Container(

                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                child: TextField(controller: _email, decoration: InputDecoration(hintText: "Enter your Email",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.mail)),)
              ),
              SizedBox(height:10,),
              Text("Password", style: AppWidget.semibolStyle(),),
              SizedBox(height:10,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                child: TextField(controller: _password, decoration: InputDecoration(hintText: "Enter Password",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.password)))
              ),
              SizedBox(height:5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forget Password?", style: TextStyle(color: Colors.teal[400],fontSize: 18),),
                ],
              ),
              SizedBox(height:10,),
              GestureDetector(
                onTap: _login,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.teal[400],borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),
                  ),
                ),
              ),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account ", style: AppWidget.lightStyle()),
                  GestureDetector(child: Text("Sign up", style: TextStyle(color: Colors.teal[400],fontSize: 20),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                  },),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
  _login() async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottom()));
  }
}

