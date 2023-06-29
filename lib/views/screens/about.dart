import 'package:findmyjob/constants.dart';
import 'package:findmyjob/views/screens/think.dart';
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
            SizedBox(
              height: 50,
            ),
            Text(
              'here our story',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'the team',
              style: TextStyle(
                fontSize: 16,
                backgroundColor: Color.fromRGBO(10, 10, 10, 100),
                color: Color(0xff516add),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Image.asset(
              'assets/images/grppic.png',
              height: 90,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Think()),
                );
              },
              child: Text(
                '?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
