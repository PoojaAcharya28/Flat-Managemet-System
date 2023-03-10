import 'package:flutter/material.dart';
import 'package:my_app/phone.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/animation.dart';
import 'modules/resident_add.dart';
import 'splashscreen.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'splashScreen',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

      home: const ResidentInfo(),
    );
  }
}

