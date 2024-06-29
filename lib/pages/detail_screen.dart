import 'package:ecommerce/models/my_product.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/pages/cart_details.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:provider/provider.dart';

import '../widget/support.dart';

class DetailScreen extends StatelessWidget {
  final Product products;
  const DetailScreen({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
            "Product Details",style: AppWidget.bolStyle(),
          ),
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
        ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width*.95,
            height: 270,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
            child: Image.asset(products.image, height: 120,),
          ),


        ],),
      SizedBox(height: 10,),
      Container(
          padding: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 10),
          width: MediaQuery.of(context).size.width*.95,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(products.name.toUpperCase(),
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  Text("\₹ ""${products.price}",style: TextStyle(fontSize: 22,color: Colors.black),)
                ],
              ),),
          SizedBox(height: 10,),
          Container(
          width: MediaQuery.of(context).size.width*.95,
            padding: EdgeInsets.only(left: 15,top: 20,bottom: 20,right: 15),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(products.description,style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.justify,),
              SizedBox(height: 10,),
              Text("Available Colors",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(width: 8,),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blueAccent
                  ),
                  SizedBox(width: 8,),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.red,
                  ),
                ],
              )
            ],
          ),
      ),

    ]
          )


    )),
    bottomSheet: BottomAppBar(
      color: Colors.blue[200],
      height: MediaQuery.of(context).size.height*.085,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\₹ ""${products.price}",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
            ElevatedButton.icon(onPressed: (){
              provider.toggleProduct(products);
              Navigator.push(context,MaterialPageRoute(builder: (context)=> const CartDetails()));
            }, icon: Icon(Icons.send), label: Text('Add to Cart'))
          ],
        ),

      ),

    ),);
}}
