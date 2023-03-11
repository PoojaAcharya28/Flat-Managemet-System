import 'package:flutter/material.dart';

class ElectricInfo extends StatefulWidget {
  const ElectricInfo({super.key});

  @override
  State<ElectricInfo> createState() => _ElectricInfoState();
}

class _ElectricInfoState extends State<ElectricInfo> {

  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(156, 44, 85, 95),
            title: const Text(
              "Electrical Maintaince",
              style: TextStyle(color: Colors.white),
            )),
            body: Container(
              padding: EdgeInsets.all(25.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Form(
                    child: Column(
                    children: [

                      TextFormField(
                      //controller: ownerNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        } else if (!nameRegExp.hasMatch(value)) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter Owner Name",
                        border: OutlineInputBorder(),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.other_houses),
                            hintText: "Apt Number",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your apartment number';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.other_houses),
                            hintText: "Flat Number",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your flat number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  

                    ],
                  ))

                ],
              ),
            ),
      

    );
  }
}