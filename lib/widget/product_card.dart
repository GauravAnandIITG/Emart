import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/favourite_proovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key,required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: (){
                provider.toggleFavourite(widget.product);
                },
                  child: Icon(
                    provider.isExist(widget.product)?
                    Icons.favorite:
                    Icons.favorite_border_outlined,color: Colors.red,))
            ],
          ),
          SizedBox(
            height: 140,
            width: 140,
            child: Image.asset(widget.product.image,height: 120,width: 120,),
          ),
          Text(widget.product.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text("\₹ "'${widget.product.price}')
          

          
        ],
      ),
    );
  }
}


