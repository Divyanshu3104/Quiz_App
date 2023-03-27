import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class APIs {
  //For Authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  //For Accessing Cloud FireStore Database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
