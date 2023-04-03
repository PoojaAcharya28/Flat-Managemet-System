import 'package:flutter/material.dart';
import 'package:my_app/phone.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/animation.dart';
import 'modules/Maintaince/calculation.dart';
import 'modules/Maintaince/calculation_display.dart';
import 'modules/Maintaince/electrical.dart';
import 'modules/Maintaince/hvac.dart';
import 'modules/Maintaince/maintaince_add.dart';
import 'modules/Maintaince/plumbing.dart';
import 'modules/Maintaince/structural.dart';
import 'modules/Resident/resident_add.dart';
import 'modules/payment/payment.dart';
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

      home:  DashBoard(),
    );
  }
}

