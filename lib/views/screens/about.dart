import 'package:findmyjob/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        elevation: 0.0,
        //title: Text('where story begins'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'This is the About Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/grppic.png',
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
