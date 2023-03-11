import 'package:flutter/material.dart';

import '../../login.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({super.key});

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  //final TextEditingController ownerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(156, 44, 85, 95),
            title: const Text(
              "Maintaince",
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

                  Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Common Area Maintaince",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),

                  // Container(
                  //   color: Color.fromARGB(255, 255, 248, 222),
                  //   child: Column(
                  //     children: [

                  //     ],
                  //   ),

                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "cleaning",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          //labelText: "Landscaping",
                          hintText: "Landscaping",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                              ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          //labelText: "Landscaping",
                          hintText: "Pest Control",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                              ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          //labelText: "Landscaping",
                          hintText: "Flooring",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                              ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          //labelText: "Landscaping",
                          hintText: "Other Repairs",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                              ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {}, child: Text("Expenses")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Unit Area Maintaince",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          //margin: EdgeInsets.all(10.0),

                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Electrical",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          )),
                      TextButton(onPressed: () {}, child: Text("No")),
                      TextButton(onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SecondRoute();
                              }),
                            );
                      }, child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          //margin: EdgeInsets.all(10.0),

                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Plumbing ",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          )),
                      TextButton(onPressed: () {}, child: Text("No")),
                      TextButton(onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SecondRoute();
                              }),
                            );
                      }, child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          //margin: EdgeInsets.all(10.0),

                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "   HVAC   ",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          )),
                      TextButton(onPressed: () {}, child: Text("No")),
                      TextButton(onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SecondRoute();
                              }),
                            );
                      }, child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          //margin: EdgeInsets.all(10.0),

                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Structural",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          )),
                      TextButton(onPressed: () {}, child: Text("No")),
                      TextButton(onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SecondRoute();
                              }),
                            );
                      }, child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Unit area Expenses")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Total Expenses")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      )),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
