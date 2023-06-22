import 'dart:async';
import 'package:findmyjob/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  SignUpScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the state is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color.fromRGBO(114, 230, 255, 100).withOpacity(1),
              const Color.fromRGBO(6, 210, 255, 100).withOpacity(1),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/findmyjob123.svg',
              height: 102,
              width: 102,
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/FindMyPage.png',
              height: 100,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
