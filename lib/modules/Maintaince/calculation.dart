import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../database_helper.dart';
import 'calculation_modal.dart';

class Calculation extends StatefulWidget {
  final Calculation? calculation;

  const Calculation({super.key, required this.floornum, required this.flatnum, required this.name, required this.common_area_expenses, required this.unit_area_expenses, this.calculation});

  //const Calculation({Key? key, this.calculation}) : super(key: key);


  final String floornum;
  final String flatnum;
  final String name;
  final String common_area_expenses;
  final String unit_area_expenses;


  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {

  var time = DateTime.now();
  //var payment_time = DateFormat().format(time);

  final TextEditingController cnameController = TextEditingController();
  final TextEditingController cfloorController = TextEditingController();
  final TextEditingController cflatController = TextEditingController();
  final TextEditingController c_common_area_Controller = TextEditingController();
  final TextEditingController c_unit_area_Controller = TextEditingController();


  final TextEditingController c_amount_paid = TextEditingController();
  final TextEditingController c_pay_status = TextEditingController();

  final TextEditingController c_time_controller = TextEditingController();




  void calculateSum_amount_pay(){
    int value7 = int.tryParse(c_common_area_Controller.text) ?? 0; 
    int value8 = int.tryParse(c_unit_area_Controller.text) ?? 0;
    int amt_sum = value7 + value8;
    c_amount_paid.text = amt_sum.toString();

  }


  @override
  void initState() {
    super.initState();
    

    cnameController.text = widget.name;
    cfloorController.text = widget.floornum;
    cflatController.text = widget.flatnum;
    c_common_area_Controller.text = widget.common_area_expenses;
    c_unit_area_Controller.text = widget.unit_area_expenses;
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    cnameController.dispose();
    cfloorController.dispose();
    cflatController.dispose();

    c_common_area_Controller.dispose();
    c_unit_area_Controller.dispose();

    super.dispose();
  }

  // void _handleCalculate() async{
  //   final calculation = Calculation(
  //     id: widget.calculation?.id,
  //     cname: cnameController.text,
  //     cfloor: cfloorController.text,
  //     cflat: cflatController.text,

  //     c_com_area_unit: int.tryParse(c_common_area_Controller.text) ?? 0,
  //     c_unit_area_unit: int.tryParse(c_unit_area_Controller.text) ?? 0,
  //     amt_paid: int.tryParse(c_amount_paid.text) ?? 0,

  //     status: c_pay_status.text,
  //     time: c_time_controller.text,




  //   );

  //   int result;
  //   result = await DatabaseHelper.addCalculation(calculation);


  // }


  final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(156, 44, 85, 95),
          title: const Text(
            "Calculation",
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
                    controller: cnameController,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                      child: TextFormField(
                        controller: cfloorController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.other_houses),
                          hintText: "Floor Number",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Floor number';
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
                        controller: cflatController,
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
                  height: 20,
                ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "Common Area Unit",
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
                            controller: c_common_area_Controller,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: " Per Unit Area ",
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
                            controller:c_unit_area_Controller,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [TextButton(onPressed: calculateSum_amount_pay, child: Text("Amount to be paid")),
                      
                      //Text("      Amount to be paid           "),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                            controller: c_amount_paid,

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
                    height:20.0
                  ),
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        readOnly: true,
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: " Payment Status ",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: TextFormField(
                        controller:c_pay_status ,
                        decoration: InputDecoration(
                          hintText: " yes? or No? ",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        var getTime = DateFormat().format(time);
                        c_time_controller.text = getTime.toString();

                      }, child: Text("time")),
                      SizedBox(width: 10.0,),
                      Expanded(child: TextFormField(
                        controller: c_time_controller,
                        
                        readOnly: true,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Payment Time",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),

                        

                      )),
                    ],
                  ),
                  //OutlinedButton(onPressed: () {}, child: Text("Paid")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("Payment?"),
                                    content: Text(
                                        "Do you want to do the payment now? or later?"),
                                    actions: [
                                      TextButton(
                                        onPressed: (){},
                                          //onPressed: _handleCalculate,  
                                          child: Text("Yes")),
                                      TextButton(
                                          onPressed: () {}, child: Text("No")),
                                    ],
                                    elevation: 25.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)));
                              });
                        },
                        child: Text("Payment")),
                  ),
                 // Text("current time : ${DateFormat().format(time)}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
