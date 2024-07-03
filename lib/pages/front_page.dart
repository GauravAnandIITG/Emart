import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:flutter/material.dart';

class front extends StatefulWidget {
  const front({super.key});

  @override
  State<front> createState() => _frontState();
}

class _frontState extends State<front> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 5,right: 5),
        child: Column( children: [
          Image.asset("assests/back.png"),
          Text("A world of products\n Just a click away !" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top:30),
            decoration: BoxDecoration( color: Colors.green, borderRadius : BorderRadius.circular(20),),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
            },child: Text("Get Started",style: TextStyle(color: Colors.white, fontSize: 25),),


          )

          )],
          
        )
      ),


    );
  }
}
// TODO Implement this library.
