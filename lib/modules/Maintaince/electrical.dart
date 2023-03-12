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
    return Scaffold(
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
                  height: 15,
                ),

                
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Type of Electrical Issue",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "eg: malfunctioning switch,power outage, tripped breaker",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Location of the Electrical Issue",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "eg: specfic room or area",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description of Issue",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "Description of the Issue eg: sparks, burning smell",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Electrical Appliances Affected",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "eg: lights, outlets, HVAC system ",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Expenses",
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

                ElevatedButton(onPressed: (){}, child: Text("Submit"))

                
              ],
            ))
          ],
        ),
      ),
    );
  }
}
