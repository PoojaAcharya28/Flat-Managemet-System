import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'login.dart';
import 'phone.dart';


class SplashScreen extends StatefulWidget {
  late final VoidCallback onTap;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

const TextStyle textStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => DashBoard(),));
     });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final background = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          
          image: AssetImage('assets/images/splashscreen.jpeg'),
          fit: BoxFit.cover),
    ),
  );

  final greyopacity = Container(
    color: Color.fromARGB(210, 49, 51, 51),
  );



  Widget button(String label, Function onTap) {
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, -0.6), end: Offset.zero)
            .animate(_controller),
        child: Material(
          
          color: Color.fromARGB(255, 205, 142, 78),
          borderRadius: BorderRadius.circular(30.0),
          child: InkWell(
            onTap: onTap(),
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            child: Container(
              width: 200.0,
              padding: EdgeInsets.symmetric(vertical: 13.0),
              child: Center(
                child: Text(
                  label,
                  style: textStyle.copyWith(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final logo = new ScaleTransition(
      scale: _animation,
      child: Image.asset(
        'assets/images/logo.png',
        width: 150.0,
        height: 150.0,
      ),
    );

    //   final description = Text(
    //   "Make your Real Estate Home the best it can be",
    //   textAlign: TextAlign.center,
    //   style: textStyle.copyWith(fontSize:24.0),
    // );

    final description = new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, -0.8), end: Offset.zero)
            .animate(_controller),
        child: Text(
          "Make your Real Estate Home the best it can be",
          textAlign: TextAlign.center,
          style: textStyle.copyWith(fontSize: 24.0),
        ),
      ),
    );

    final separator = new FadeTransition(
      opacity: _animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 20.0,
            height: 2.0,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Makes life easy',
              style: textStyle,
            ),
          ),
          Container(
            width: 20.0,
            height: 2.0,
            color: Colors.white,
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          greyopacity,
          new SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  logo,
                  SizedBox(
                    height: 60.0,
                  ),
                  description,
                  SizedBox(
                    height: 60.0,
                  ),
                  button('welcome', () {
                    //print('hiii');
                  }),
                  SizedBox(
                    height: 8.0,
                  ),
                  button('Get Started', () {
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),);
                    };
                  }),
                  SizedBox(
                    height: 60.0,
                  ),
                  separator,
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
