import 'package:flutter/material.dart';

import 'resident_modal.dart';

class ResidentDisplaypage extends StatefulWidget {
  const ResidentDisplaypage({super.key});

  @override
  State<ResidentDisplaypage> createState() => _ResidentDisplaypageState();
}

class _ResidentDisplaypageState extends State<ResidentDisplaypage> {
  List<Resident> _resident = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flat Records'),

      ),


    );
  }
}