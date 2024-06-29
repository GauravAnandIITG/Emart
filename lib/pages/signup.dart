import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
 String? name,email,password;
 TextEditingController namecontroller= new TextEditingController();
 TextEditingController mailcontroller= new TextEditingController();
 TextEditingController passwordcontroller= new TextEditingController();
 //final _formkey =GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assests/sign-up-8694031-6983270.png",),
                SizedBox(height:8,),
                Center(child: Text("Sign Up", style: AppWidget.bolStyle(),)),
                Center(child: Text("Please Enter the details below to\n                       continue", style: AppWidget.lightStyle(),)),
                SizedBox(height:10,),
                Text("Name", style: AppWidget.semibolStyle(),),
                SizedBox(height:10,),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                    child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(hintText: "Enter your Name",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.perm_identity)),)
                ),
                SizedBox(height:15,),
                Text("Email", style: AppWidget.semibolStyle(),),
                SizedBox(height:10,),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                    child: TextField(
                      controller: mailcontroller,
                      decoration: InputDecoration(hintText: "Enter your Email",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.mail)),)
                ),
                SizedBox(height:15,),
                Text("Password", style: AppWidget.semibolStyle(),),
                SizedBox(height:10,),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                    child: TextField(
                      controller: passwordcontroller,
                        decoration: InputDecoration(hintText: "Enter Password",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.password)))
                ),
                SizedBox(height:25,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.indigo[600],borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),
                    ),
                  ),
                ),
                SizedBox(height:10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account ", style: AppWidget.lightStyle()),
                    GestureDetector(child: Text("Sign In", style: TextStyle(color: Colors.indigo[600],fontSize: 20),),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                    } ),
                  ],
                ),
                SizedBox(height:10,),
              ],
            ),
          ),
        ),


    );
  }
}
