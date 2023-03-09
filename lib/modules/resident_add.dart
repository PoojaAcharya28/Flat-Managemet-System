import 'package:flutter/material.dart';

import 'resident_detail_screen.dart';

class ResidentInfo extends StatefulWidget {
  const ResidentInfo({super.key});

  

  @override
  State<ResidentInfo> createState() => _ResidentInfoState();
}

class _ResidentInfoState extends State<ResidentInfo> {

  

  final firstNameController = TextEditingController();

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
              TextFormField(
                controller: firstNameController,

                // onChanged: (val){
                //   _updateText(val);
                // },

                decoration:InputDecoration(
                  
                  
                  icon:Icon(Icons.person),
                  hintText: "Enter First Name",
                  border: OutlineInputBorder(),
                )

              ),
              //Text("Owner Name is ${FirstNameController.text}"),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:InputDecoration(
                  
                  icon:Icon(Icons.person),
                  hintText: "Enter Last Name",
                  border: OutlineInputBorder(),
                )

              ),
              OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) { return DetailsScreen(ownerName: firstNameController.text);} 
              ),
            );
          },
          child: Text("Submit Form"),
          style: OutlinedButton.styleFrom(minimumSize: Size(200, 50)),
        ),
          
              


              
            ],
          ),
        ));
  }


}
