import 'package:flutter/material.dart';
import 'package:findmyjob/constants.dart';

class JTextFormField extends StatelessWidget {
  final String labelText;
  const JTextFormField({
    Key? key,
    required this.labelText,
    required String? Function(dynamic value) validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: kprimarycolor,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
