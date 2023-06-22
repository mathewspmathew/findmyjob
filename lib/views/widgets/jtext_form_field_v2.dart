import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findmyjob/constants.dart';

class JTextFormField2 extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController controller;
  const JTextFormField2({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.obscureText, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: kPrimaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
