import 'package:ecommerce/models/my_product.dart';
import 'package:ecommerce/pages/cart_details.dart';
import 'package:ecommerce/pages/detail_screen.dart';
import 'package:ecommerce/widget/product_card.dart';
import 'package:ecommerce/widget/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
   int isSelected =0;
   @override
   void initState() {
     super.initState();
     loadUserProfile();
   }

   loadUserProfile() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       name = prefs.getString('name') ?? '';
     });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.grey[200],
       body: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                     GestureDetector(
                       onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> const CartDetails())),
                       child: ClipRRect(borderRadius: BorderRadius.circular(15),
                           child: Image.asset(
                             "assests/7835563.png", height: 50, width: 50,)),
                     )
                   ]
               ),
               SizedBox(height: 30,),
               Text("Categories", style: TextStyle(color: Colors.black,
                   fontSize: 25,
                   fontWeight: FontWeight.bold),),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Category(index: 0, image: "assests/all_6051296.png"),
                   Category(index: 1, image: 'assests/cloth.png'),
                   Category(index: 2, image: 'assests/3659899.png'),

                 ],
               ),
                isSelected==0 ? _buildAllProducts() : isSelected==1 ? Fashion() : Gadgets()
             ],
           ),
         ),
       ),

     );
   }

   _buildAllProducts() =>
       GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: (100 / 140),
             crossAxisSpacing: 12,
             mainAxisSpacing: 12,
           ),
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           itemCount: MyProducts.allProducts.length,
           itemBuilder: (context, index) {
             final allProducts = MyProducts.allProducts[index];
             return GestureDetector(
               onTap: ()=> Navigator.push(
                 context,MaterialPageRoute(builder: (context)=> DetailScreen(products: allProducts))
               ),
                 child: ProductCard(product: allProducts));
           }

       );

   Category({required int index, required String image}) =>
       GestureDetector(
         onTap: () => setState(()=>isSelected=index),
         child: Container(
           //width: 105,
           margin: EdgeInsets.only(top: 10, left: 5,right: 5),
           padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: isSelected==index? Colors.blue[400]:Colors.white),
           child: Image.asset(
             "${image}", height: 50, width: 50,),
         ),);
   Fashion()=>
       GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: (100 / 140),
             crossAxisSpacing: 12,
             mainAxisSpacing: 12,
           ),
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           itemCount: MyProducts.FashionList.length,
           itemBuilder: (context, index) {
             final FashionProducts = MyProducts.FashionList[index];
             return GestureDetector(
                 onTap: ()=> Navigator.push(
                     context,MaterialPageRoute(builder: (context)=> DetailScreen(products: FashionProducts))
                 ),
                 child: ProductCard(product: FashionProducts));
           }

       );
   Gadgets()=>
       GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: (100 / 140),
             crossAxisSpacing: 12,
             mainAxisSpacing: 12,
           ),
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           itemCount: MyProducts.electronicList.length,
           itemBuilder: (context, index) {
             final ElectricProducts = MyProducts.electronicList[index];
             return GestureDetector(onTap: ()=> Navigator.push(
                 context,MaterialPageRoute(builder: (context)=> DetailScreen(products: ElectricProducts))
             ),
                 child: ProductCard(product: ElectricProducts));
           }

       );



 }


