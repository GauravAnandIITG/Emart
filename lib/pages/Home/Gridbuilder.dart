import 'package:ecommerce/models/viewmodel.dart';
import 'package:ecommerce/pages/detail_screen.dart';
import 'package:ecommerce/widget/product_card.dart';
import 'package:flutter/material.dart';

class gridlist extends StatefulWidget {
  const gridlist({super.key});

  @override
  State<gridlist> createState() => _gridlistState();
}

class _gridlistState extends State<gridlist> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ViewModelMain().getallProduct(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text(
              'No product found.',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Game_Tape',
                color: Color(0xFFFFF1E8),
              ),
            ));
          }
          final products = snapshot.data!;
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (95/ 140),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(onTap: ()=> Navigator.push(
                    context,MaterialPageRoute(builder: (context)=> DetailScreen(products: product))
                ),
                    child: ProductCard(product: product));
              }
          );
        });
  }
}
