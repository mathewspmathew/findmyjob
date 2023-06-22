import 'package:findmyjob/provider/accessstorage.dart';
import 'package:findmyjob/views/screens/base_nav_screen.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'package:findmyjob/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:findmyjob/routes.dart';
import 'package:findmyjob/theme.dart';
import 'package:provider/provider.dart';



class findmyjobApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
                ChangeNotifierProvider(create: (_) => AccessStorage()),

      ],
      child: GetMaterialApp(
          title: 'findmyjob',
          theme: theme(),
          routes: routes,
          debugShowCheckedModeBanner: false,
           home: const SplashScreen() //BaseNavScreen(),
           //home: const JobDetailsScreen() //BaseNavScreen(),
          //home: BaseNavScreen() //BaseNavScreen(),
          // initialRoute: MyProfileScreen.route,
          ),
    );
  }
}
