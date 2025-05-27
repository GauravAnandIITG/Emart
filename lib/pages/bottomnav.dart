import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/pages/cart_details.dart';
import 'package:ecommerce/pages/favorite_screen.dart';
import 'package:ecommerce/pages/Home/home.dart';
import 'package:ecommerce/pages/profile.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  late List<Widget> pages;
  late Home HomePage;
  late FavoriteScreen Favorite;
  late ProfileView Profile;
  late CartDetails cartDetails;
  int tabindex = 0;

  @override
  void initState() {
    HomePage = Home();
    Favorite = FavoriteScreen();
    Profile = ProfileView();
    cartDetails = CartDetails();

    pages = [HomePage, Favorite,cartDetails, Profile ]; //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.grey.shade200,
        color: Colors.black87,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            tabindex = index;
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.perm_identity, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white), // 4th tab
        ],
      ),
      body: pages[tabindex],
    );
  }
}
