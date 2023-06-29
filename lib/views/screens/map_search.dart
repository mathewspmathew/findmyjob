import "package:findmyjob/constants.dart";
import "package:findmyjob/views/screens/base_nav_screen.dart";
import "package:findmyjob/views/screens/my_profile_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/get_navigation.dart";

class DependentDropdownExample extends StatefulWidget {
  const DependentDropdownExample({Key? key}) : super(key: key);

  @override
  _DependentDropdownExampleState createState() =>
      _DependentDropdownExampleState();
}

class _DependentDropdownExampleState extends State<DependentDropdownExample> {
  List<String> districtList = ['Ernakulam', 'Kottayam', 'Idukki'];
  Map<String, List<String>> panchayathMap = {
    'Ernakulam': ['Avoly', 'Kaloor', 'Ayavana'],
    'Kottayam': ['Palai', 'Bharananganam', 'Ettumanoor'],
    'Idukki': ['Thodupuzha', 'Karinkunnam', 'Munnar'],
  };

  String? selectedDistrict;
  String? selectedPanchayath;
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserUID();
  }

  void getUserUID() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 6, 2, 47)),
        title: Text(
          'Select Your Location',
          style: Get.textTheme.headline4?.copyWith(
            fontSize: 25.0,
            color: Color.fromARGB(255, 84, 78, 78),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(114, 230, 255, 100).withOpacity(1),
              const Color.fromRGBO(6, 210, 255, 100).withOpacity(1),
              // Color.fromARGB(156, 10, 2, 84).withOpacity(1),
              // Color.fromARGB(156, 28, 25, 222).withOpacity(1),
            ],
          ),
        ),
        child: Transform.translate(
          offset: Offset(0.0, -100.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 220,
                  ),
                  Icon(
                    Icons.search,
                    size: 150,
                    color: Color.fromARGB(255, 6, 2, 47),
                  ),
                  Container(
                    height: 400,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 71, 70, 70),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: const Text('Select District',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              value: selectedDistrict,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDistrict = newValue;
                                  selectedPanchayath = null;
                                });
                              },
                              items: districtList.map((String district) {
                                return DropdownMenuItem<String>(
                                  value: district,
                                  child: Text(
                                    district,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 23, 22, 22)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 71, 70, 70),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: const Text('Select Panchayath',
                                  style: TextStyle(color: Colors.black)),
                              value: selectedPanchayath,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPanchayath = newValue;
                                });
                              },
                              items: selectedDistrict != null
                                  ? panchayathMap[selectedDistrict]!
                                      .map((String panchayath) {
                                      return DropdownMenuItem<String>(
                                        value: panchayath,
                                        child: Text(
                                          panchayath,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList()
                                  : [],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(100, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 6, 2, 47).withOpacity(1),
                            ),
                          ),
                          child: const Text(
                            "Search",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            if (selectedDistrict != null &&
                                selectedPanchayath != null) {
                              print('District: $selectedDistrict');
                              print('Panchayath: $selectedPanchayath');

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BaseNavScreen(),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (userId == 'SLfGdDVGyOPncfgzvRnM5n17mvI2')
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 50)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 6, 2, 47).withOpacity(1),
                                ),
                              ),
                              child: const Text(
                                "Add Place",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController districtController =
                                        TextEditingController();
                                    TextEditingController panchayathController =
                                        TextEditingController();

                                    return AlertDialog(
                                      title: const Text('Add Place'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller: districtController,
                                            decoration: InputDecoration(
                                              hintText: 'Enter District',
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller: panchayathController,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Panchayath',
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            String newDistrict =
                                                districtController.text;
                                            String newPanchayath =
                                                panchayathController.text;

                                            if (newDistrict.isNotEmpty &&
                                                newPanchayath.isNotEmpty) {
                                              if (!districtList
                                                  .contains(newDistrict)) {
                                                setState(() {
                                                  districtList.add(newDistrict);
                                                });
                                              }

                                              if (panchayathMap[newDistrict] ==
                                                  null) {
                                                panchayathMap[newDistrict] = [
                                                  newPanchayath
                                                ];
                                              } else {
                                                if (!panchayathMap[newDistrict]!
                                                    .contains(newPanchayath)) {
                                                  setState(() {
                                                    panchayathMap[newDistrict]!
                                                        .add(newPanchayath);
                                                  });
                                                }
                                              }
                                            }
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Submit'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        Transform.translate(
                          offset: const Offset(0.0, 250.0),
                          child: SizedBox(
                            height: 40,
                            child: Image.asset(
                              'assets/images/FindMyPage.png',
                              height: 100,
                              width: 200,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
