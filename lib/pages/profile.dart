import 'dart:io';

import 'package:ecommerce/models/authentication.dart';
import 'package:ecommerce/pages/front_page.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }
  final ImagePicker _picker = ImagePicker();
  XFile? file;


  loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      final imagePath = prefs.getString('profileImagePath');
      if (imagePath != null) {
        file = XFile(imagePath);
    }});
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      //appBar: AppBar(title: Text('Profile Page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),backgroundColor: Colors.grey[900],),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 20,),
            Center(child: Text("Profile Page", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40))),
          SizedBox(height: 30,),
          GestureDetector(
              onTap: () async {
                final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                if (photo != null) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('profileImagePath', photo.path);
                  setState(() {
                    file = photo;
                  });
                }
              },

              child: Container(
                height: 120,
             padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 110,right: 110),
              width: 120,
              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(5)),
              child: file != null ? Image.file(File(file!.path),fit: BoxFit.cover,) : Image.asset("assests/img_1.png" ,height: 120,width: 120,fit: BoxFit.fitHeight,),
            ),
          ),
          SizedBox(height: 20,),
          Text(" My Details", style: AppWidget.bolStyle()),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
            margin: EdgeInsets.only(left: 5,right: 5,top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Text('Name', style: AppWidget.lightStyle()),
                  ],
                ),
                SizedBox(width: 10,),
                Text('$name', style: AppWidget.semibolStyle())
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.only(left: 15,bottom: 10,top: 10),
            margin: EdgeInsets.only(left: 5,right: 5,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 10,),
                    Text('Email', style: AppWidget.lightStyle()),
                  ],
                ),
                Text('$email', style: AppWidget.semibolStyle()),
              ],
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: ()async{
              await AuthService().signout().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Front()));
              });
            },
            child:
            Text('Sign Out',style: TextStyle(color: Colors.white,fontSize: 20),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900], // Change this to your desired color
            ),
          ),
        ],
      ),
    );
  }
}

