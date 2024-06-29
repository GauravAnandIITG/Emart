import 'package:ecommerce/widget/support.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Text(
            "Profile",style: AppWidget.bolStyle(),
          ),
        ),
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      )
    )
    ;
  }
}

