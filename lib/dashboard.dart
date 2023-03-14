import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/widgets/bottom_nav_bar.dart';
import 'package:my_app/widgets/category_card.dart';

import 'login.dart';
import 'modules/Maintaince/maintaince_add.dart';
import 'modules/Resident/resident_add.dart';
import 'modules/Resident/resident_detail_screen.dart';
import 'modules/payment/payment.dart';

class DashBoard extends StatefulWidget {

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  // @override
  // void initState() {

  //   SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      
      
  //   });
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;   //total height of my phone
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(),
      body: Stack(     
        children: <Widget>[
          Container(
            color: Color(0xDCDCDC),
          ),

          Container(height: size.height * .45 ,   //45% of total height
          decoration: BoxDecoration(
            image: DecorationImage(
              //image: AssetImage('assets/images/dashboard1.jpg'
              //image: AssetImage('assets/images/dashboard2.jpg'      // proper
             // image: AssetImage('assets/images/dashboard3.jpg'
             //image: AssetImage('assets/images/download4.jpg'
             //image: AssetImage('assets/images/download5.jpg'
             image: AssetImage('assets/images/download6.jpg',
             

              )),
            //color:Color.fromARGB(168, 206, 204, 204),        //light grey
           // color:Color.fromARGB(121, 63, 63, 63),  
           // color:Color.fromARGB(194, 38, 38, 38),         //secondhand grey
            //color:Color.fromARGB(241, 142, 142, 144),  //SILVER
           //color:Color.fromARGB(208, 45, 84, 94),     //onyx
          ),) ,
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children:<Widget> [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color:Color.fromARGB(77, 240, 235, 235),
                        shape:BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg",
                      color: Colors.white,
                      
                      // height: 1,
                      // width: 1,
                      fit: BoxFit.scaleDown,),
                    ),

                  ),
                  Text("PHA\nApartment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    // shadows:[
                    //   Shadow(color: Colors.white,
                    //   offset: Offset(10,-10),
                    //   blurRadius:4)
                    // ] ,
                    fontWeight: FontWeight.bold
                  ),),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                     

                    ),
                    
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: SvgPicture.asset("assets/icons/search.svg",
                      height: 20,
                      width: 20,),
                       border: InputBorder.none,
                      ),
                    ),

                  ),
                  Expanded(
                    child: GridView.count(crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,

                    children: <Widget> [
                  
                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){       
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResidentInfo(),
                              ),
                            );

                        },
                      ),
                      CategoryCard(
                        title: "Maintenance",
                        svgSrc: "assets/icons/support.svg",
                        press: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Maintenance(),
                              ),
                            );

                        },
                      ),

                      CategoryCard(
                        title: "Payment",
                        svgSrc: "assets/icons/receipt5.svg",
                        press: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentInfo(),
                              ),
                            );
                          
                        },
                      ),

                      CategoryCard(
                        title: "Flat Records",
                        svgSrc: "assets/icons/flat.svg",
                        press: (){},
                      ),

                      // CategoryCard(
                      //   title: "Residents",
                      //   svgSrc: "assets/icons/admin.svg",
                      //   press: (){},
                        
                      // ),

                      // CategoryCard(
                      //   title: "Residents",
                      //   svgSrc: "assets/icons/admin.svg",
                      //   press: (){},
                      // ),

                  
                    ],
                    ),
                  )

                ],
              ),
            ),
          ), 
          
        ],
      ),
    );
  }
}

