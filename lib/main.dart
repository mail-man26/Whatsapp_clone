import 'package:flutter/material.dart';
import 'package:waclone/pages/homescreen.dart';
import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:waclone/pages/models.dart';
import 'package:waclone/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
