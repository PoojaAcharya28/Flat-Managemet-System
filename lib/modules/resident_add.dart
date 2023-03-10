import 'package:flutter/material.dart';

import 'resident_detail_screen.dart';

enum ownerType { Owner, Tenant }

class ResidentInfo extends StatefulWidget {
  const ResidentInfo({super.key});

  @override
  State<ResidentInfo> createState() => _ResidentInfoState();
}

class _ResidentInfoState extends State<ResidentInfo> {
  ownerType? _PrivateOwnerType;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();

    super.dispose();
  }

  // @override
  // void initState() {

  //   super.initState();
  //  // _OwnerName = FirstNameController.text;

  //   FirstNameController.addListener(_updateText as VoidCallback);

  // }

  // void _updateText(val){
  //   setState(() {
  //    // _OwnerName=val;
  //    _OwnerName = FirstNameController.text;

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(168, 206, 204, 204),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(156, 44, 85, 95),
            title: const Text(
              "Add Resident Information",
              style: TextStyle(color: Colors.white),
            )),
        body: Container(
          padding: EdgeInsets.all(25.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Expanded
                      (
                        child: TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                      
                            // onChanged: (val){
                            //   _updateText(val);
                            // },
                      
                            decoration: InputDecoration(
                              //icon: Icon(Icons.person),
                              prefixIcon:Icon(Icons.person), 
                              hintText: "Enter First Name",
                              border: OutlineInputBorder(
                                
                              ),
                            )),
                      ),
                      //Text("Owner Name is ${FirstNameController.text}"),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter Last Name",
                          border: OutlineInputBorder(),
                        )),
                      ),
                      

                        ],
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email address",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: contactController,
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        hintText: "Enter Contact Number",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_iphone),
                        hintText: "WhatsApp Number",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        hintText: "Previous home address",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity),
                        hintText: "Adhaar Card Number",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.other_houses),
                        hintText: "Appartment Number",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.other_houses),
                        hintText: "Flat Number",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.family_restroom),
                        hintText: "Number of People staying",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.timelapse),
                        hintText: "Lease Duration",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range),
                        hintText: "Move_in_date",
                        border: OutlineInputBorder(),
                      )),
                      SizedBox(
                        height: 10,
                      ),

                      
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<ownerType>(
                              contentPadding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              title: Text("Owner"),
                              value: ownerType.Owner,
                              groupValue: _PrivateOwnerType,
                              dense: true,
                              tileColor: Color.fromARGB(255, 240, 233, 233),
                              onChanged: (val) {
                                setState(() {
                                  _PrivateOwnerType = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: RadioListTile<ownerType>(
                              contentPadding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              title: Text("Tenant"),
                              value: ownerType.Tenant,
                              groupValue: _PrivateOwnerType,
                              dense: true,
                              tileColor: Color.fromARGB(255, 240, 233, 233),
                              onChanged: (val) {
                                setState(() {
                                  _PrivateOwnerType = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen(
                                  ownerName: firstNameController.text,
                                  lastName:lastNameController.text,
                                  contact:contactController.text);
                            }),
                          );
                        },
                        child: Text("Submit Form"),
                        style: OutlinedButton.styleFrom(
                            minimumSize: Size(200, 50)),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
