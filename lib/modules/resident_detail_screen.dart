import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String ownerName;
  final String lastName;
  final String contact;
  DetailsScreen({required this.ownerName,required this.lastName, required this.contact, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(156, 44, 85, 95),
        title: Text(
          "Resident Details",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(ownerName),
              subtitle: Text(lastName),
              trailing: Text(contact),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(ownerName),
              subtitle: Text(lastName),
              trailing: Text(contact),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(ownerName),
              subtitle: Text(lastName),
              trailing: Text(contact),
            )
          ],
        ),
      ),
    );
  }
}
