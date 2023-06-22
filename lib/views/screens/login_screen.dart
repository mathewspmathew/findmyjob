import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyjob/domain/authent.dart';
import 'package:findmyjob/views/screens/map_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:findmyjob/constants.dart';
import 'package:findmyjob/views/screens/signup_screen.dart';
import 'package:findmyjob/views/widgets/jtext_form_field_v2.dart';
import 'package:findmyjob/views/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';
  LoginScreen({Key? key}) : super(key: key);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: double.infinity,
                color: Color.fromRGBO(114, 230, 255, 100).withOpacity(1),
                child: SafeArea(
                  child: Center(
                      child: Text(
                    'Welcome Back',
                    style: Get.textTheme.headline4,
                  )),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          JTextFormField2(
                            labelText: 'Email',
                            prefixIcon: CupertinoIcons.device_phone_portrait,
                            textInputType: TextInputType.emailAddress,
                            controller: emailcontroller,
                          ),
                          JTextFormField2(
                            labelText: 'Password',
                            prefixIcon: CupertinoIcons.lock,
                            suffixIcon: CupertinoIcons.eye,
                            obscureText: true,
                            controller: passwordcontroller,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kButtonColor,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () async {
                                final response = await loginUser(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                                    if(response){
                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DependentDropdownExample()));
                                    }

                                
                              },
                              child: Text('Login'),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Or login with',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialButton(
                                imagePath: 'assets/images/facebook.png',
                                onPressed: () {},
                              ),
                              SocialButton(
                                imagePath: 'assets/images/google.png',
                                onPressed: () {},
                              ),
                              SocialButton(
                                imagePath: 'assets/images/linkedin.png',
                                onPressed: () {},
                              ),
                              SocialButton(
                                imagePath: 'assets/images/twitter.png',
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New to Jobiee?',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAndToNamed(SignUpScreen.route);
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
