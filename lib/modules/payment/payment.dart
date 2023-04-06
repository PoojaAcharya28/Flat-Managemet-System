import 'package:flutter/material.dart';

import '../../database_helper.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  final TextEditingController p_floor_Controller = TextEditingController();
  final TextEditingController p_flat_Controller = TextEditingController();
  final TextEditingController p_name_Controller = TextEditingController();

  List<Map<String, dynamic>> paymentDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(156, 44, 85, 95),
          title: const Text(
            "Payment Information",
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: p_floor_Controller,
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
                          controller: p_flat_Controller,
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
                    height: 15,
                  ),
                  TextFormField(
                      controller: p_name_Controller,
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
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print('Tapped');

                        // Get the name from the database using the floor and flat number
                        final query =
                            'SELECT cname,amt_paid,status,time FROM calculations WHERE cfloor = ? AND cflat = ? AND cname = ?';
                        final result = await DatabaseHelper.rawQuery(query, [
                          p_floor_Controller.text,
                          p_flat_Controller.text,
                          p_name_Controller.text
                        ]);
                        print(result);
                        setState(() {
                          paymentDetails = result;
                        });

                        // Clear the form fields

                        p_floor_Controller.clear();
                        p_flat_Controller.clear();
                        p_name_Controller.clear();
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Column(
              children: [
                Text(
                  'Payment Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: paymentDetails.length,
                  itemBuilder: (context, index) {
                    final paymentDetail = paymentDetails[index];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        title: Text('Name: ${paymentDetail['cname']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount Paid: ${paymentDetail['amt_paid']}'),
                            Text('Status: ${paymentDetail['status']}'),
                            Text('Time: ${paymentDetail['time']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//..............................................
 //   onPressed: () async{

                //   print('Tapped');
                //             // Get the name from the database using the floor and flat number
                //             final query =
                //                 'SELECT cname,amt_paid,status,time FROM calculations WHERE cfloor = ? AND cflat = ? AND cname = ?';
                //             final result = await DatabaseHelper.rawQuery(query,
                //                 [p_floor_Controller.text, p_flat_Controller.text,p_name_Controller.text]);
                //             print(result);

                //             // Update the name field if a result was found
                //             // if (result.isNotEmpty) {
                //             //   setState(() {
                //             //     nameController.text = result.first['fname'];
                //             //   });
                //             // } else {
                //             //   setState(() {
                //             //     nameController.text = '';
                //             //   });
                //             // }

                // }, 