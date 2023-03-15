import 'package:flutter/material.dart';

import 'resident_detail_screen.dart';

enum ownerType { Owner, Tenant } //radio buttons

class ResidentInfo extends StatefulWidget {
  const ResidentInfo({super.key});

  @override
  State<ResidentInfo> createState() => _ResidentInfoState();
}

class _ResidentInfoState extends State<ResidentInfo> {
  ownerType? _PrivateOwnerType;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController whatsappcontactController =
      TextEditingController();
  final TextEditingController homeController = TextEditingController();
  final TextEditingController adhaarController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatNumberController = TextEditingController();
  final TextEditingController numofpeopleController = TextEditingController();
  //final TextEditingController leaseController = TextEditingController();
 // final TextEditingController moveinController = TextEditingController();

  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    contactController.dispose();
    whatsappcontactController.dispose();
    homeController.dispose();
    adhaarController.dispose();
    floorController.dispose();
    flatNumberController.dispose();
    numofpeopleController.dispose();
    //leaseController.dispose();
    //moveinController.dispose();

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
                          Expanded(
                            child: TextFormField(
                                controller: firstNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  } else if (!nameRegExp.hasMatch(value)) {
                                    return 'Please enter a valid name';
                                  }
                                  return null;
                                },

                                // onChanged: (val){
                                //   _updateText(val);
                                // },

                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "First Name",
                                  border: OutlineInputBorder(),
                                )),
                          ),
                          //Text("Owner Name is ${FirstNameController.text}"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                                controller: lastNameController,
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
                                  hintText: "Last Name",
                                  border: OutlineInputBorder(),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email address",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: contactController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          hintText: "Enter Contact Number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a contact number';
                          } else if (!RegExp(r'^[+]?[0-9]{10,12}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid contact number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_iphone),
                          hintText: "WhatsApp Number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a WhatsApp number';
                          } else if (!RegExp(r'^[+]?[0-9]{10,12}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid WhatsApp number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          hintText: "Previous home address",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter door number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
                          hintText: "Adhaar Card Number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Aadhaar card number';
                          } else if (!RegExp(r'^[0-9]{12}$').hasMatch(value)) {
                            return 'Please enter a valid Aadhaar card number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.other_houses),
                          hintText: "Floor Number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Floor number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.other_houses),
                          hintText: "Flat Number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your flat number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.family_restroom),
                          hintText: "Number of People staying",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter  number of people staying';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextFormField(
                      //     decoration: InputDecoration(
                      //   prefixIcon: Icon(Icons.timelapse),
                      //   hintText: "Lease Duration",
                      //   border: OutlineInputBorder(),
                      // )),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     prefixIcon: Icon(Icons.date_range),
                      //     hintText: "Move_in_date",
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter the lease duration';
                      //     } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                      //       return 'Please enter a valid lease duration (in months)';
                      //     }
                      //     return null;
                      //   },
                      // ),
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
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                    ownerName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    contact: contactController.text);
                              }),
                            );
                          }
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
