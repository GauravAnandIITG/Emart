import 'dart:developer';

import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email="",password="";
  TextEditingController mailcontroller= new TextEditingController();
  TextEditingController passwordcontroller= new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  userLogin()async{
    try{
      await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottom()));
    }on FirebaseAuthException catch(e){
      if (e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Account doesn't exist")));
      }
      else if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Incorrect Password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: Form(
            key:  _formkey,
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
                  child: TextFormField(
                    validator: (value){
                      if (value==null||value.isEmpty){
                        return "Please Enter Your E mail";
                      }
                      return null;
                    },
                    controller: mailcontroller, decoration: InputDecoration(hintText: "Enter your Email",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.mail)),)
                ),
                SizedBox(height:10,),
                Text("Password", style: AppWidget.semibolStyle(),),
                SizedBox(height:10,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                  child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty){
                          return "Please Enter Your password";
                        }
                        return null;
                      },
                      controller: passwordcontroller, decoration: InputDecoration(hintText: "Enter Password",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.password)))
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
                  onTap: (){
                    if (_formkey.currentState!.validate()){
                      setState(() {
                        email=mailcontroller.text;
                        password=passwordcontroller.text;
                      });
                    }
                    userLogin();
                  },
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
      ),

    );
  }
}

