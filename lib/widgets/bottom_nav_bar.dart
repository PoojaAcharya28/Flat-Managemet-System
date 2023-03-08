import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20,vertical: 10 ),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            
            svgSrc: "assets/icons/arrowback.svg",
            title: "Back",
            press: (){},
          ),
          BottomNavItem(
            title: "Home",
            svgSrc: "assets/icons/home2.svg",
            press: (){},
          ),

          BottomNavItem(
            title: "Next",
            svgSrc: "assets/icons/arrowforward.svg",
            press: (){},
          )

        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  final bool isActive;
  
  
  const BottomNavItem({
    super.key,
     required this.svgSrc, 
     required this.title,
      required this.press,
       this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(svgSrc,
          ),
          Text(title,
          ),
    
        ],
      ),
    );
  }
}

