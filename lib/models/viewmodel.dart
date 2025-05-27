import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:ui' as ui;

class ViewModelMain extends ChangeNotifier{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Product> allProduct =[];

  Future<List<Product>> getallProduct() async{
    try {
      QuerySnapshot ProductSnapshot = await db.collection("products").get();
      allProduct.clear();
      for (var product in ProductSnapshot.docs){
        allProduct.add(Product.fromMap(product.data() as Map<String,dynamic>));
      }
      notifyListeners();
    } catch(e){
      print("Error is $e");
    }
    return allProduct;
  }
}