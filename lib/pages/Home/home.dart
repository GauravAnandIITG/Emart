import 'dart:io';

import 'package:ecommerce/pages/Home/Gridbuilder.dart';
import 'package:ecommerce/pages/cart_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
 class Home extends StatefulWidget {
   const Home({super.key});
   @override
   State<Home> createState() => _HomeState();
 }
 class _HomeState extends State<Home> {
   String name = '';
   List categories = [
     "assests/TV.png",
     "assests/cloth.png",
   ];
   int isSelected = 0;

   @override
   void initState() {
     super.initState();
     loadUserProfile();
   }
   XFile? file;

   loadUserProfile() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       name = prefs.getString('name') ?? '';
       final imagePath = prefs.getString('profileImagePath');
       if (imagePath != null) {
         file = XFile(imagePath);
       }
     });
   }



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.grey[200],
       body: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.only(top: 50, left: 20, right: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Hey, $name", style: TextStyle(
                               color: Colors.black,
                               fontSize: 30,
                               fontWeight: FontWeight.bold),),
                           Text("Good Morning", style: TextStyle(
                               color: Colors.black45,
                               fontSize: 20,
                               fontWeight: FontWeight.w700),),
                         ]),
                     ClipRRect(borderRadius: BorderRadius.circular(25),
                         child: file != null ? Image.file(File(file!.path),fit: BoxFit.cover,height: 50,width: 50,) : Image.asset("assests/img_1.png" ,height: 120,width: 120,fit: BoxFit.fitHeight,),
                     )]
               ),
               SizedBox(height: 30,),
               Text("Categories", style: TextStyle(color: Colors.black,
                   fontSize: 25,
                   fontWeight: FontWeight.bold),),
               SizedBox(height: 10,),
               Row(
                 //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                 ],
               ),
               gridlist()
             ],
           ),
         ),
       ),

     );
   }

 }