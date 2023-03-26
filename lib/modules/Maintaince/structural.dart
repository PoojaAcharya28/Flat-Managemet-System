import 'package:flutter/material.dart';

class StructureInfo extends StatefulWidget {
  const StructureInfo({super.key, required this.floornum, required this.flatnum, required this.name});

  final String floornum;
  final String flatnum;
  final String name;


  @override
  State<StructureInfo> createState() => _StructureInfoState();
}

class _StructureInfoState extends State<StructureInfo> {

  final TextEditingController snameController = TextEditingController();
  final TextEditingController sfloorController = TextEditingController();
  final TextEditingController sflatController = TextEditingController();
  final TextEditingController sexpensesController = TextEditingController();

  @override
  void initState() {
    super.initState();
   

    snameController.text = widget.name;
    sfloorController.text = widget.floornum;
    sflatController.text = widget.flatnum;
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    snameController.dispose();
    sfloorController.dispose();
    sflatController.dispose();
    sexpensesController.dispose();
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
            "Structural Maintaince",
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
                    controller: snameController,
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
                        controller: sfloorController,
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
                        controller: sflatController,
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
                      "Type of Structural Issue",
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
                        "eg: cracks in walls or ceiling, roof leaks",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Location of the structural Issue",
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
                        "Description of the Issue eg: visible damage, water stains",
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Age and condition of the building or unit",
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
                        "Be specific ",
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
                          controller: sexpensesController,
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
                  Navigator.pop(context, sexpensesController.text);
                }, child: Text("Submit"))

                
              ],
            ))
          ],
        ),
      ),
    );
  }
}