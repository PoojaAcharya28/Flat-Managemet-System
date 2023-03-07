import 'package:flutter/material.dart';
import 'otp.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  @override
  State<MyPhone> createState() => MyPhoneState();
}

class MyPhoneState extends State<MyPhone> {
  TextEditingController phoneText = TextEditingController();
  TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                //image: AssetBundleImageProvider("assets\images\splashscreen.jpeg"),
                //image:const AssetBundleImageProvider(""),
                image: AssetImage('assets/images/security.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
            //color: Color.fromARGB(19, 49, 51, 51),
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image.asset('assets/images/security.jpg',width: 150,height: 150,),
                  Text(
                    "Phone Verification",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add your Phone Number We need to register your phone before getting started",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //height:55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 205, 142, 78),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        SizedBox(
                            width: 40,
                            child: TextField(
                              controller: countrycode,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 205, 142, 78),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                        Text(
                          "|",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 205, 142, 78)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                              controller: phoneText,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 142, 78),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Phone Number",
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white60,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                      width: 200.0,
                      child: ElevatedButton(
                          onPressed: () {
                            String userPhone = phoneText.text.toString();

                            print("Phone: $userPhone");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyOtp()),
                            );
                          },
                          child: Text(
                            "Send the code",
                            style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      
                    ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 205, 142, 78),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )))),
                ],
              ),
            )),
      ]),
    );
  }
}
