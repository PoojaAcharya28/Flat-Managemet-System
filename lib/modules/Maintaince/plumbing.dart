import 'package:flutter/material.dart';

class PlumbingInfo extends StatefulWidget {
  const PlumbingInfo({super.key, required this.floornum, required this.flatnum, required this.name});

  final String floornum;
  final String flatnum;
  final String name;

  @override
  State<PlumbingInfo> createState() => _PlumbingInfoState();
}

class _PlumbingInfoState extends State<PlumbingInfo> {

  final TextEditingController pnameController = TextEditingController();
  final TextEditingController pfloorController = TextEditingController();
  final TextEditingController pflatController = TextEditingController();
  final TextEditingController pexpensesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // enameController.text = TextEditingController(text: widget.name) as String;
    // efloorController.text = TextEditingController(text: widget.floornum) as String;
    // eflatController.text = TextEditingController(text: widget.flatnum) as String;

    pnameController.text = widget.name;
    pfloorController.text = widget.floornum;
    pflatController.text = widget.flatnum;
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    pnameController.dispose();
    pfloorController.dispose();
    pflatController.dispose();
    pexpensesController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(156, 44, 85, 95),
          title: const Text(
            "Plumbing Maintaince",
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
                    controller: pnameController,
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
                        controller: pfloorController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.other_houses),
                          hintText: "Floor Number",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your floor number';
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
                        controller: pflatController,
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
                      "Type of Plumbing Issue",
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
                        "eg: leaky faucet, clogged drain, running toilet",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Location of the Plumbing Issue",
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
                        "eg: specfic bathroom or Kitchen",
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
                        "Description of the Issue eg: water damage, foul odor",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Appliances or Fixtures Affected",
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
                        "eg: sink, shower, dishwasher ",
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
                          controller: pexpensesController,
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

                ElevatedButton(onPressed: (){
                  Navigator.pop(context, pexpensesController.text);
                }, child: Text("Submit"))

                
              ],
            ))
          ],
        ),
      ),
    );
  }
}