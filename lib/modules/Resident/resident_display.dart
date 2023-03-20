import 'package:flutter/material.dart';
import 'package:my_app/modules/Resident/resident_add.dart';

import '../../database_helper.dart';
import 'resident_modal.dart';

class ResidentDisplaypage extends StatefulWidget {
  const ResidentDisplaypage({super.key});

  @override
  State<ResidentDisplaypage> createState() => _ResidentDisplaypageState();
}

class _ResidentDisplaypageState extends State<ResidentDisplaypage> {
  List<Resident> _resident = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final residents = await DatabaseHelper.getResident();
    setState(() {
      _resident = residents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flat Records'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MyForm(),
          //     ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _resident.length,
          itemBuilder: (context, index) {
            final resident = _resident[index];
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
                          builder: (context) => ResidentInfo(
                              resident:
                                  resident), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        // final updatedUser = result['resident'] as resident;
                        // final userId = result['id'] as int;
                        // await DatabaseHelper.updateResident(residentId, updateResident);
                        // await _fetchUsers();   //come back later okay after editing form
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child: Text(resident.fname,),
                      child: Text('${resident.fname} ${resident.lname}'),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email : ' +
                          '${resident.email},\n' +
                          'Contact:' +
                          '${resident.contact}, \n' +
                          'Whatsapp :' +
                          '${resident.wcontact}, \n' +
                          'Door Number : ' +
                          '${resident.home}, \n' +
                          'Adhaar Number :' +
                          '${resident.adhaar}, \n' +
                          'Floor Number :' +
                          '${resident.floor}, \n' +
                          'Flat Number : ' +
                          '${resident.flat}, \n' +
                          'No of People : ' '${resident.no_people} '),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirmDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text(
                                  "Are you sure you want to delete this ${resident.fname}?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirmDelete != null && confirmDelete) {
                          await DatabaseHelper.deleteResident(resident.id!);
                          await _fetchUsers();
                        }
                      },
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
