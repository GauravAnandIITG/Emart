import 'package:ecommerce/pages/bottomnav.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/favourite_proovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/front_page.dart';
import 'pages/home.dart';
import 'package:provider/provider.dart';
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=> CartProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'E Mart',
      home: HomePage(),
    ),
  );

}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: front(),
    );
  }
}


