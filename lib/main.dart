import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// Business Layer Q&A
// Scope of work - Crafty Bay App
// Design UI/UX -> Q&A
// Project Initiate -> Define project version


// --------- Coding Part---------//
// Setup Firebase
// Crashlytics
// Project Structure -> MVVM , Clear Architecture, MVP, Onion

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


