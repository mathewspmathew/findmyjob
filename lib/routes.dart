import 'package:flutter/material.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'package:findmyjob/views/screens/login_screen.dart';
import 'package:findmyjob/views/screens/my_profile_screen.dart';
import 'package:findmyjob/views/screens/signup_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // HomeScreen.route: (_) => HomeScreen(),
  JobDetailsScreen.route: (_) => JobDetailsScreen(
        selectDistrict: 'fsda',
        selectPanchayath: 'dfgsfd',
      ),
  MyProfileScreen.route: (_) => MyProfileScreen(),
  LoginScreen.route: (_) => LoginScreen(),
  SignUpScreen.route: (_) => SignUpScreen(),
};
