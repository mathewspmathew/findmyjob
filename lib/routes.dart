import 'package:findmyjob/views/screens/home_profile.dart';
import 'package:flutter/material.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'package:findmyjob/views/screens/login_screen.dart';
import 'package:findmyjob/views/screens/my_profile_screen.dart';
import 'package:findmyjob/views/screens/signup_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // HomeScreen.route: (_) => HomeScreen(),
  JobDetailsScreen.route: (_) => JobDetailsScreen(
      // selectDistrict: 'fsda',
      // selectPanchayath: 'dfgsfd',
      ),

  MyProfileScreen.route: (_) => MyProfileScreen(),

  HomeProfile.route: (_) => HomeProfile(),
  LoginScreen.route: (_) => LoginScreen(),
  SignUpScreen.route: (_) => SignUpScreen(),
};
