import 'package:flutter/material.dart';

import 'homepage.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2)); // Adjust the duration as needed

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BottomNavBarExample(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;

          var tween = Tween<double>(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          var scaleAnimation = tween.animate(curvedAnimation);

          var offsetAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: Offset.zero,
          ).animate(curvedAnimation);

          return ScaleTransition(
            scale: scaleAnimation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/logo.gif'),
      ),
    );
  }
}