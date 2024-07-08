import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future  signout() async {
      await FirebaseAuth.instance.signOut();
    }


     }

