import 'package:flutter/material.dart';

class CalculationDisplaypage extends StatefulWidget {
  const CalculationDisplaypage({super.key});

  @override
  State<CalculationDisplaypage> createState() => _CalculationDisplaypageState();
}

class _CalculationDisplaypageState extends State<CalculationDisplaypage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(156, 44, 85, 95),
        title: Text('Calculation Records',
        style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),)

    );
  }
}