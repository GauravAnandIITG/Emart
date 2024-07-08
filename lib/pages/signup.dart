import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

final _formkey = GlobalKey<FormState>();



registration()async{
  if(password!=null && name!=null && email !=null){
    try{
      saveUserProfile();
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent , content: Text("Registered Successfully")));
         Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    } on FirebaseException catch(e){
      if (e.code=="weak-password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is too weak")));
      }
      else if (e.code=="email-already-in-use"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account already exist")));
      }
    }

  }
}

 loadUserProfile() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
     namecontroller.text = prefs.getString('name') ?? '';
     mailcontroller.text = prefs.getString('email') ?? '';
   });
 }

 saveUserProfile() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('name', namecontroller.text);
   prefs.setString('email', mailcontroller.text);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Form(
            key: _formkey,
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
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty){
                            return "Please Enter Your Name";
                          }
                          return null;
                        },
                        controller: namecontroller,
                        decoration: InputDecoration(hintText: "Enter your Name",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.perm_identity)),)
                  ),
                  SizedBox(height:15,),
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
                        controller: mailcontroller,
                        decoration: InputDecoration(hintText: "Enter your Email",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.mail)),)
                  ),
                  SizedBox(height:15,),
                  Text("Password", style: AppWidget.semibolStyle(),),
                  SizedBox(height:10,),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(10) ),
                      child: TextFormField(
                          obscureText: true,
                          validator: (value){
                            if (value==null||value.isEmpty){
                              return "Field can't be empty";
                            }
                            return null;
                          },
                        controller: passwordcontroller,
                          decoration: InputDecoration(hintText: "Enter Password",border: InputBorder.none, hintStyle: AppWidget.lightStyle(),prefixIcon: Icon(Icons.password)))
                  ),
                  SizedBox(height:25,),
                  GestureDetector(
                    onTap: (){
                      if (_formkey.currentState!.validate()){
                        setState(() {
                          name = namecontroller.text;
                          email= mailcontroller.text;
                           password=passwordcontroller.text;
                        });
                      }
                      registration();
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      } ),
                    ],
                  ),
                  SizedBox(height:10,),
                ],
              ),
          ),
          ),
        ),


    );
  }

}
