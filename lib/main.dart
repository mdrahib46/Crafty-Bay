import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'app/crafty_bay_app.dart';

// Business Layer Q&A
// Scope of work - Crafty Bay App
// Design UI/UX -> Q&A
// Project Initiate -> Define project version


// --------- Coding Part---------//
// Setup Firebase
// Crashlytics
// Project Structure -> MVVM , Clear Architecture, MVP, Onion

// Layer First Architecture / Structure =>
// Feature First Architecture

// ETC => Easy to change
// SOC

// Theming
// Navigation


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const CraftyBayApp());
}


