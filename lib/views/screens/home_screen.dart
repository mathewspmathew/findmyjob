import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyjob/views/screens/home_profile.dart';
import 'package:findmyjob/views/screens/job_det.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:findmyjob/views/screens/my_profile_screen.dart';
import 'package:findmyjob/views/widgets/job_item_card.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // backgroundColor: Color.fromARGB(189, 1, 55, 99),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Find My Job'),
          backgroundColor: kScaffoldBackgroundColor,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () {
                //Get.toNamed(HomeProfile.route);
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile_image.png'),
              ),
            ),
          ],
        ),

        floatingActionButton: SizedBox(
          width: 130,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddJob()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              primary: Colors.blue[900], // Adjust the shade of blue as needed
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add_circle_outline),
                SizedBox(width: 8.0),
                Text('Add Job'),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: const TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Find your dream job',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jobs for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('jobdetails')
                    .snapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.docs.length as int,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];

                          return JobItemCard(
                            docid: documentSnapshot.id,
                            jobs: documentSnapshot['category'],
                            jobTitle: documentSnapshot['location'],
                            jobsLogoUrl: documentSnapshot['joblogo'],
                            widget: JobDetailsScreen(
                              jobTitle: documentSnapshot['category'],
                              description: documentSnapshot['description'],
                              salary: documentSnapshot['salary'],
                              selectDistrict: documentSnapshot['district'],
                              selectPanchayath:
                                  documentSnapshot['panchayat'],
                              posteddate: documentSnapshot['postdate'],
                              phoneNumber: documentSnapshot['phonenumber'],
                              profimg: documentSnapshot['profimg'],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
