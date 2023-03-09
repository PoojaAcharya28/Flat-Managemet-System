import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  
  const CategoryCard({
    super.key, 
    required this.svgSrc, 
    required this.title, 
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
  
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow:[BoxShadow(offset:Offset(0, 17),
          blurRadius: 17,
          spreadRadius: -23,
          color:Color.fromARGB(221, 127, 23, 23) ),
          ]
        ),
        child: Material(
          color:Colors.transparent,
          child: InkWell(
            
            onTap:()=> press(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(title,  //defined in the above ....
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
