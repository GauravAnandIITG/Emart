import 'package:ecommerce/providers/favourite_proovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    final finalList = provider.favourites;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
            children: [
              SizedBox(height: 40,),
              Text("Favorite Products !", style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder:(context,index){
                    return Padding(padding: EdgeInsets.all(10),
                      child: Slidable(
                        endActionPane:ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(onPressed: (context){
                            finalList.removeAt(index);
                            setState(() {
                            });
                          },
                            icon: Icons.delete,
                            label: "Delete",
                            backgroundColor: Colors.red,
                          )]) ,
                        child: ListTile(
                          title: Text(finalList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          subtitle: Text(finalList[index].description,overflow: TextOverflow.ellipsis,),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(finalList[index].image,),
                            backgroundColor: Colors.blue[100],
                          ),
                          trailing: Text("\₹ ${finalList[index].price}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          tileColor: Colors.white
                        ),
                      ),
                    );
                  }))
            ],
      
        
      ),
    );
  }
}


