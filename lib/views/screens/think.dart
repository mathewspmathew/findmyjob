import 'package:findmyjob/constants.dart';
import 'package:flutter/material.dart';

class Think extends StatelessWidget {
  const Think({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/think.png',
          height: 400,
        ),
      ),
    );
  }
}
