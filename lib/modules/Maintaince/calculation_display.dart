import 'package:flutter/material.dart';
import '../../database_helper.dart';
import 'calculation.dart';
import 'calculation_modal.dart';
import 'maintaince_add.dart';
import 'receipt.dart';

class CalculationDisplaypage extends StatefulWidget {
  const CalculationDisplaypage({super.key});

  @override
  State<CalculationDisplaypage> createState() => _CalculationDisplaypageState();
}

class _CalculationDisplaypageState extends State<CalculationDisplaypage> {
  List<Calculation> _calculation = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final calculations = await DatabaseHelper.getCalculations();
    setState(() {
      _calculation = calculations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(156, 44, 85, 95),
        title: Text(
          'payment Records',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Maintenance(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _calculation.length,
          itemBuilder: (context, index) {
            final calculation = _calculation[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Colors.white,
                selectedTileColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Container(
                  //     decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 2,
                  //       blurRadius: 5,
                  //       offset: Offset(0, 3),
                  //     ),
                  //   ],
                  // ),

                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalculationInfo(
                            calculation: calculation,
                            floornum: calculation.cfloor ?? '',
                            flatnum: calculation.cflat ?? '',
                            name: calculation.cname ?? '',
                            common_area_expenses:
                                (calculation.c_com_area_unit ?? '').toString(),
                            unit_area_expenses:
                                (calculation.c_unit_area_unit ?? '').toString(),
                          ), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedCalculation =
                            result['calculation'] as Calculation;
                        final calculationId = result['id'] as int;
                        await DatabaseHelper.updateCalculation(
                            calculationId, updatedCalculation);
                        await _fetchUsers(); //come back later okay after editing form
                      }
                    },
                    // leading: ElevatedButton(onPressed: (){}, child: Text("Receipt")),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child: Text(resident.fname,),
                      child: Text('${calculation.cname} '),
                    ),
                    subtitle: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Floor Number : ${calculation.cfloor} ,\n' +
                                      'Flat Number: ${calculation.cflat}, \n' +
                                      'Common unit area expenses : ${calculation.c_com_area_unit}, \n' +
                                      'Per unit area expenses : ${calculation.c_unit_area_unit}, \n',
                                  // 'Total payment amount : ${calculation.amt_paid}, \n',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Total payment amount : ${calculation.amt_paid}, \n',
                                  style: TextStyle(
                                    color: calculation.status == 'no'
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Payment Status : ${calculation.status}, \n',
                                  style: TextStyle(
                                    color: calculation.status == 'no'
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Payment Timing : ${calculation.time}  ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // child: Text('Floor Number : ' +
                          //     '${calculation.cfloor} ,\n' +
                          //     'Flat Number:' +
                          //     '${calculation.cflat}, \n' +
                          //     'Common unit area expenses :' +
                          //     '${calculation.c_com_area_unit}, \n' +
                          //     'Per unit area expenses : ' +
                          //     '${calculation.c_unit_area_unit}, \n' +
                          //     'Total payment amount :' +
                          //     '${calculation.amt_paid}, \n' +
                          //     'Payment Status :' +
                          //     '${calculation.status}, \n' +
                          //     'Payment Timing : ' +
                          //     '${calculation.time}  '),
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ReceiptInfo();
                                    }),
                                  );
                                },
                                child: Text("Generate Receipt")))
                      ],
                    ),
                    trailing: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                          onPressed: () async {
                            bool confirmDelete = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm Delete"),
                                  content: Text(
                                      "Are you sure you want to delete this ${calculation.cname}?"),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancel"),
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                    ),
                                    TextButton(
                                      child: Text("Delete"),
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (confirmDelete != null && confirmDelete) {
                              await DatabaseHelper.deleteCalculation(
                                  calculation.id!);
                              await _fetchUsers();
                            }
                          },
                        ),
                        //TextButton(onPressed: (){}, child: Text("Receipt"))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
