import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/widgets/category_card.dart';

import 'login.dart';

class DashBoard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;   //total height of my phone
    return  Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
        height: 80,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/home2.svg",
                  ),
                  Text("Home"),
            
                ],
              ),
            )

          ],
        ),
      ),
      body: Stack(     
        children: <Widget>[
          Container(height: size.height * .45 ,   //45% of total height
          decoration: BoxDecoration(
            color:Color.fromARGB(168, 206, 204, 204),        //light grey
           // color:Color.fromARGB(121, 63, 63, 63),  
           // color:Color.fromARGB(194, 38, 38, 38),         //secondhand grey
            //color:Color.fromARGB(241, 142, 142, 144),  //SILVER
            //color:Color.fromARGB(208, 73, 73, 75),     //onyx
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
                        color:Color.fromARGB(77, 162, 159, 159),
                        shape:BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg",
                      // height: 1,
                      // width: 1,
                      fit: BoxFit.scaleDown,),
                    ),

                  ),
                  Text("PHA\nApartment",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
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
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),);

                        },
                      ),
                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){},
                      ),

                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){},
                      ),

                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){},
                      ),

                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){},
                      ),

                      CategoryCard(
                        title: "Residents",
                        svgSrc: "assets/icons/admin.svg",
                        press: (){},
                      ),

                  
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

