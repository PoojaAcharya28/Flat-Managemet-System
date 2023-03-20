import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../database_helper.dart';
import 'resident_detail_screen.dart';
import 'resident_display.dart';
import 'resident_modal.dart';

//enum ownerType { Owner, Tenant } //radio buttons

class ResidentInfo extends StatefulWidget {
  final Resident? resident;

  //const ResidentInfo({super.key});

  const ResidentInfo({Key? key, this.resident}) : super(key: key);

  @override
  State<ResidentInfo> createState() => _ResidentInfoState();
}

class _ResidentInfoState extends State<ResidentInfo> {
  var logger = Logger();

  //ownerType? _PrivateOwnerType;

  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController contactController = TextEditingController();
  late TextEditingController whatsappcontactController =
      TextEditingController();
  late TextEditingController homeController = TextEditingController();
  late TextEditingController adhaarController = TextEditingController();
  late TextEditingController floorController = TextEditingController();
  late TextEditingController flatNumberController = TextEditingController();
  late TextEditingController numofpeopleController = TextEditingController();
  //final TextEditingController radioController = TextEditingController();
  //final TextEditingController leaseController = TextEditingController();
  // final TextEditingController moveinController = TextEditingController();

  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super
        .initState(); //checking here if data received or not . if not null we will set to our field
    firstNameController =
        TextEditingController(text: widget.resident?.fname ?? '');

    lastNameController =
        TextEditingController(text: widget.resident?.lname ?? '');

    emailController = TextEditingController(text: widget.resident?.email ?? '');

    contactController = TextEditingController(
        text: widget.resident?.contact != null
            ? widget.resident!.contact.toString()
            : '');

    whatsappcontactController = TextEditingController(
        text: widget.resident?.wcontact != null
            ? widget.resident!.wcontact.toString()
            : '');

    homeController = TextEditingController(text: widget.resident?.home ?? '');

    adhaarController = TextEditingController(
        text: widget.resident?.adhaar != null
            ? widget.resident!.adhaar.toString()
            : '');

    floorController = TextEditingController(text: widget.resident?.floor ?? '');

    flatNumberController =
        TextEditingController(text: widget.resident?.flat ?? '');

    numofpeopleController = TextEditingController(
        text: widget.resident?.no_people != null
            ? widget.resident!.no_people.toString()
            : '');
  }

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

  void _handleSubmit() async {
    final resident = Resident(
      id: widget.resident?.id,
      fname: firstNameController.text,
      lname: lastNameController.text,
      email: emailController.text,
      contact: int.tryParse(contactController.text) ?? 0,
      wcontact: int.tryParse(whatsappcontactController.text) ?? 0,
      home: homeController.text,
      adhaar: int.tryParse(adhaarController.text) ?? 0,
      floor: floorController.text,
      flat: flatNumberController.text,
      no_people: int.tryParse(numofpeopleController.text) ?? 0,
      // radio:   _PrivateOwnerType.toString(),
    );

    int result;
    // if(widget.resident == null){
    result = await DatabaseHelper.addResident(resident);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User added successfully!'),
        duration: Duration(seconds: 2),
      ),
    );

    // if (result != null && result > 0) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('User added successfully!'),
    //         duration: Duration(seconds: 2),
    //       ),
    //     );
    //     // Clear the form fields after adding/updating the user
    //     // firstNameController.clear();
    //     // ageController.clear();
    //     // emailController.clear();
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('Failed to add user.'),
    //         duration: Duration(seconds: 2),
    //       ),
    //     );
    //   }

    // }
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
                        controller: whatsappcontactController,
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
                        controller: homeController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          hintText: "Door Number",
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
                        controller: adhaarController,
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
                        controller: floorController,
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
                        controller: flatNumberController,
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
                        controller: numofpeopleController,
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

                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: RadioListTile<ownerType>(
                      //         contentPadding: EdgeInsets.all(0.0),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(30.0)),
                      //         title: Text("Owner"),
                      //         value: ownerType.Owner,
                      //         groupValue: _PrivateOwnerType,
                      //         dense: true,
                      //         tileColor: Color.fromARGB(255, 240, 233, 233),
                      //         onChanged: (val) {
                      //           setState(() {
                      //             _PrivateOwnerType = val;

                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 5.0,
                      //     ),
                      //     Expanded(
                      //       child: RadioListTile<ownerType>(
                      //         contentPadding: EdgeInsets.all(0.0),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(30.0)),
                      //         title: Text("Tenant"),
                      //         value: ownerType.Tenant,
                      //         groupValue: _PrivateOwnerType,
                      //         dense: true,
                      //         tileColor: Color.fromARGB(255, 240, 233, 233),
                      //         onChanged: (val) {
                      //           setState(() {
                      //             _PrivateOwnerType = val;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed:
                            // if (_formkey.currentState!.validate()) {
                            _handleSubmit,

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return DetailsScreen(
                        //         ownerName: firstNameController.text,
                        //         lastName: lastNameController.text,
                        //         contact: contactController.text);
                        //   }),
                        // );
                        // }

                        child: Text("Submit Form"),
                        style: OutlinedButton.styleFrom(
                            minimumSize: Size(200, 50)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResidentDisplaypage()),
                          );
                        },
                        child: Text('see data inserted'),
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