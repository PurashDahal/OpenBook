import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/View/login.dart';
import 'dart:async';

import 'package:openbook/View/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );

    _animationController.forward();

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/book.png', height: 350),
              SizedBox(height: 20),
              Text(
                "OPENBOOK",
                style: GoogleFonts.adamina(
                  textStyle: TextStyle(color: Colors.black, fontSize: 34),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
