import 'package:flutter/material.dart';

import '../../database_helper.dart';
import '../../login.dart';
import 'calculation.dart';
import 'electrical.dart';
import 'hvac.dart';
import 'plumbing.dart';
import 'structural.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({super.key});

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  final TextEditingController floController = TextEditingController();
  final TextEditingController flaController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController commonunitController = TextEditingController();
  final TextEditingController repairController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();


  final TextEditingController electricalController = TextEditingController();
  final TextEditingController plumbingController = TextEditingController();
  final TextEditingController hvacController = TextEditingController();
  final TextEditingController structuralController = TextEditingController();
  final TextEditingController unit_area_expensesController = TextEditingController();
  
  String _valueFromElectricInfo = "";

  



  void calculateSum_commonarea(){
    int value1 = int.tryParse(commonunitController.text) ?? 0; 
    int value2 = int.tryParse(repairController.text) ?? 0;
    int common_area_sum = value1 + value2;
    expensesController.text = common_area_sum.toString();

  }

  void calculateSum_unitarea(){
    int value3 = int.tryParse(electricalController.text) ?? 0; 
    int value4 = int.tryParse(plumbingController.text) ?? 0; 
    int value5 = int.tryParse(hvacController.text) ?? 0; 
    int value6 = int.tryParse(structuralController.text) ?? 0; 
    int unit_area_sum = value3 + value4 +value5 + value6;
    unit_area_expensesController.text = unit_area_sum.toString();


  }


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
            children: [
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: floController,
                          onTap: () async {
                            print('Tapped');
                            // Get the name from the database using the floor and flat number
                            final query =
                                'SELECT fname FROM residents WHERE floor = ? OR flat = ?';
                            final result = await DatabaseHelper.rawQuery(query,
                                [floController.text, flaController.text]);
                            print(result);
                            // Update the name field if a result was found
                            if (result.isNotEmpty) {
                              setState(() {
                                nameController.text = result.first['fname'];
                              });
                            } else {
                              setState(() {
                                nameController.text = '';
                              });
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.other_houses),
                            hintText: "Floor Number",
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
                          controller: flaController,
                          onTap: () async {
                            print('Tapped');
                            print('Floor: ${floController.text}');
                            print('Flat: ${flaController.text}');
                            // Get the name from the database using the floor and flat number
                            final query =
                                'SELECT fname FROM residents WHERE floor = ? OR flat = ?';
                            print('Before query');
                            final result = await DatabaseHelper.rawQuery(query,
                                [floController.text, flaController.text]);
                            print('After query');
                            print(result);

                            print("hi");
                            // Update the name field if a result was found
                            if (result.isNotEmpty) {
                              setState(() {
                                nameController.text = result.first['fname'];
                              });
                            } else {
                              setState(() {
                                nameController.text = '';
                                print(nameController.text);
                              });
                            }
                          },
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
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return TextFormField(
                          enabled: false,
                          //readOnly: true,

                          controller: nameController,
                          onChanged: (value) {
                            print(
                                value); // prints the value of nameController to console
                          },
                          // initialValue: nameController.text,
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
                          ));
                    },
                  ),
                  //Text("${nameController.text}"),

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
                          hintText: "Common unit area",
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
                            keyboardType: TextInputType.number,
                        controller: commonunitController,
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
                            keyboardType: TextInputType.number,
                        controller: repairController,
                        
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
                  // Text("data"),

                  // Text("${repairController.text}"),

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
                            onPressed: calculateSum_commonarea, child: Text("Expenses")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: expensesController,
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
                      TextButton(onPressed: () {
                        electricalController.text= '0.0';

                      }, child: Text("No")),
                      TextButton(
                          onPressed: () async{
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ElectricInfo(
                                  floornum : floController.text,
                                  flatnum : flaController.text,
                                  name : nameController.text
                                );
                              }),
                            );

                            setState(() {
              _valueFromElectricInfo = result;
              electricalController.text = _valueFromElectricInfo;
            });

                            
                          },
                          child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                            controller: electricalController,
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
                      TextButton(onPressed: () {plumbingController.text= '0.0';}, child: Text("No")),
                      TextButton(
                          onPressed: () async{
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PlumbingInfo(
                                  floornum : floController.text,
                                  flatnum : flaController.text,
                                  name : nameController.text
                                );
                              }),
                            );

                            setState(() {
              _valueFromElectricInfo = result;
              plumbingController.text = _valueFromElectricInfo;
            });

                            
                          },
                          child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                            controller: plumbingController,
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
                      TextButton(onPressed: () {
                        hvacController.text= '0.0';
                      }, child: Text("No")),
                      TextButton(
                          onPressed: () async{
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HvacInfo(
                                  floornum : floController.text,
                                  flatnum : flaController.text,
                                  name : nameController.text
                                );
                              }),
                            );

                            setState(() {
              _valueFromElectricInfo = result;
              hvacController.text = _valueFromElectricInfo;
            });

                            
                          },
                          child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                            controller: hvacController,
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
                      TextButton(onPressed: () {
                        structuralController.text= '0.0';
                      }, child: Text("No")),
                      TextButton(
                          onPressed: () async{
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return StructureInfo(
                                  floornum : floController.text,
                                  flatnum : flaController.text,
                                  name : nameController.text
                                );
                              }),
                            );

                            setState(() {
              _valueFromElectricInfo = result;
              structuralController.text = _valueFromElectricInfo;
            });

                            
                          },
                          child: Text("Yes")),
                      Expanded(
                          child: TextFormField(
                            controller: structuralController,
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
                            onPressed: calculateSum_unitarea,
                            child: Text("Unit area Expenses")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),
                      Expanded(
                          child: TextFormField(
                            controller: unit_area_expensesController,

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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Calculation(
                                    floornum : floController.text,
                                  flatnum : flaController.text,
                                  name : nameController.text,
                                  common_area_expenses : expensesController.text,
                                  unit_area_expenses : unit_area_expensesController.text, 
                                  );
                                }),
                              );
                            },
                            child: Text("Calculation")),
                      ),
                      SizedBox(
                        width: 60.0,
                      ),

                      // Expanded(
                      //     child: TextFormField(
                      //   readOnly: true,
                      //   enabled: false,
                      //   textAlign: TextAlign.center,
                      //   decoration: InputDecoration(
                      //     hintText: "0.00",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30.0),
                      //     ),
                      //     contentPadding: EdgeInsets.symmetric(
                      //         vertical: 10.0, horizontal: 10.0),
                      //   ),
                      // )),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}


//.........................................................................................commented section..........................
// onChanged: (value) async {
                          //   // Get the name from the database using the floor and flat number
                          //   final query =
                          //       'SELECT fname FROM residents WHERE floor = ? AND flat = ?';
                          //   final result = await DatabaseHelper.rawQuery(query,
                          //       [floController.text, flaController.text]);
                          //   // Update the name field if a result was found
                          //   if (result.isNotEmpty) {
                          //     setState(() {
                          //       nameController.text = result.first['fname'];
                          //     });
                          //   } else {
                          //     setState(() {
                          //       nameController.text = '';
                          //     });
                          //   }
                          // },



                          // onChanged: (value) async {
                          //   // Get the name from the database using the floor and flat number
                          //   final query =
                          //       'SELECT fname FROM residents WHERE floor = ? AND flat = ?';
                          //   final result = await DatabaseHelper.rawQuery(query,
                          //       [floController.text, flaController.text]);
                          //   // Update the name field if a result was found
                          //   if (result.isNotEmpty) {
                          //     setState(() {
                          //       nameController.text = result.first['fname'];
                          //     });
                          //   } else {
                          //     setState(() {
                          //       nameController.text = '';
                          //     });
                          //   }
                          // },


                          // Container(
                  //   color: Color.fromARGB(255, 255, 248, 222),
                  //   child: Column(
                  //     children: [

                  //     ],
                  //   ),

                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         hintText: "cleaning",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         //labelText: "Landscaping",
                  //         hintText: "Landscaping",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(
                  //             //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                  //             ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         //labelText: "Landscaping",
                  //         hintText: "Pest Control",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(
                  //             //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                  //             ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         //labelText: "Landscaping",
                  //         hintText: "Flooring",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(
                  //             //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                  //             ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),


                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         //labelText: "Landscaping",
                  //         hintText: "Pest Control",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(
                  //             //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                  //             ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Expanded(
                  //         child: TextFormField(
                  //       readOnly: true,
                  //       enabled: false,
                  //       decoration: InputDecoration(
                  //         //labelText: "Landscaping",
                  //         hintText: "Flooring",
                  //         hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         border: OutlineInputBorder(
                  //             //borderSide: BorderSide(color: Color.fromARGB(255, 177, 58, 58)),

                  //             ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     )),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: TextFormField(
                  //       textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         hintText: "0.00",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 10.0, horizontal: 10.0),
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

