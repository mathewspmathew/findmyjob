import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyjob/provider/accessstorage.dart';
import 'package:findmyjob/views/screens/home_screen.dart';
import 'package:findmyjob/views/screens/job_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  List<Map<String, dynamic>> jobList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> districtList = ['Ernakulam', 'Kottayam', 'Idukki'];
  List<String> titleList = ['Cleaning', 'Sales Man', 'Catering'];
  Map<String, List<String>> panchayathMap = {
    'Ernakulam': ['Avoly', 'Kaloor', 'Ayavana'],
    'Kottayam': ['Palai', 'Bharananganam', 'Ettumanoor'],
    'Idukki': ['Thodupuzha', 'Karinkunnam', 'Munnar'],
  };
  String? selectDistrict;
  String? selectPanchayath;
  String? selectTitle;
  String? posteddate;
  String? joblogo;

  void addJobData() {
    if (selectTitle == 'Cleaning') {
      setState(() {
        joblogo = 'assets/images/cleaning.png';
      });
    }

    if (selectTitle == 'Sales Man') {
      setState(() {
        joblogo = 'assets/images/salesman.png';
      });
    }

    if (selectTitle == 'Catering') {
      setState(() {
        joblogo = 'assets/images/catering.jpg';
      });
    }
    DateTime now = DateTime.now();
    posteddate =
        '${now.year}-${(now.month)}-${(now.day)} ${(now.hour)}:${(now.minute)}';
    firestore.collection('jobdetails').add({
      'category': selectTitle,
      'description': descriptionController.text,
      'district': selectDistrict,
      'panchayat': selectPanchayath,
      'location': locationController.text,
      'salary': salaryController.text,
      'phonenumber': phoneController.text,
      'postdate': now.toString(),
      'joblogo': joblogo,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer<AccessStorage>(
              builder: (context, access, child) => Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(142, 77, 69, 158),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 71, 70, 70)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Select Category',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          value: selectTitle,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectTitle = newValue;
                            });
                          },
                          dropdownColor: Colors.black,
                          style: const TextStyle(color: Colors.blue),
                          items: titleList.map((String title) {
                            return DropdownMenuItem<String>(
                              value: title,
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                  const SizedBox(height: 4.0),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(142, 77, 69, 158),
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(142, 77, 69, 158),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 71, 70, 70)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Select District',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          value: selectDistrict,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectDistrict = newValue;
                              selectPanchayath = null;
                            });
                          },
                          dropdownColor: Colors.black,
                          style: const TextStyle(color: Colors.blue),
                          items: districtList.map((String district) {
                            return DropdownMenuItem<String>(
                              value: district,
                              child: Text(
                                district,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                  const SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(142, 77, 69, 158),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 71, 70, 70)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        hint: const Text('Select Panchayath',
                            style: TextStyle(
                                color: Color.fromARGB(255, 246, 240, 240))),
                        value: selectPanchayath,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectPanchayath = newValue;
                          });
                        },
                        dropdownColor: Colors.black,
                        items: selectDistrict != null
                            ? panchayathMap[selectDistrict]!
                                .map((String panchayath) {
                                return DropdownMenuItem<String>(
                                  value: panchayath,
                                  child: Text(
                                    panchayath,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 252, 252, 252)),
                                  ),
                                );
                              }).toList()
                            : [],
                      ))),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(142, 77, 69, 158),
                      labelText: 'Exact Location',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: salaryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(142, 77, 69, 158),
                      labelText: 'Salary',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(142, 77, 69, 158),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        access.getAccess(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: SizedBox(
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              access.pickImage(
                                                  ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            child: const ListTile(
                                              leading: Icon(Icons.camera),
                                              title: Text('Camera'),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              access.pickImage(
                                                  ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: const ListTile(
                                              leading: Icon(Icons.photo),
                                              title: Text('Gallary'),
                                            )),
                                      ],
                                    )));
                          },
                        );
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      DateTime now = DateTime.now();
                      posteddate =
                          '${now.year}-${(now.month)}-${(now.day)} ${(now.hour)}:${(now.minute)}';
                      print(posteddate);
                      addJobData();
                      addJobToList();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const Text('Add Job'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addJobToList() {
    String description = descriptionController.text;
    String location = locationController.text;
    double salary = double.parse(salaryController.text);
    String phone = phoneController.text;

    if (selectTitle == 'Cleaning') {
      setState(() {
        joblogo = 'assets/images/cleaning.png';
      });
    }

    if (selectTitle == 'Sales Man') {
      setState(() {
        joblogo = 'assets/images/salesman.png';
      });
    }

    if (selectTitle == 'Catering') {
      setState(() {
        joblogo = 'assets/images/catering.jpg';
      });
    }

    Map<String, dynamic> jobDetails = {
      'title': selectTitle,
      'location': location,
      'salary': salary.toString(),
      'district': selectDistrict,
      'panchayat': selectPanchayath,
      'joblogo': joblogo,
      'description': description,
      'posteddate': posteddate,
      'phoneNumber': phone
    };

    setState(() {
      jobLists.add(jobDetails);
    });

    // Clear input fields
    titleController.clear();
    descriptionController.clear();
    locationController.clear();
    salaryController.clear();
  }
}
