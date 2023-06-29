import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyjob/views/screens/job_det.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:findmyjob/views/screens/my_profile_screen.dart';
import 'package:findmyjob/views/widgets/job_item_card.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/';

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(189, 1, 55, 99),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Find My Job'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(MyProfileScreen.route);
            },
            child: const CircleAvatar(
                radius: 20,
                backgroundImage:
                    // NetworkImage(
                    //       'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80'),
                    AssetImage('assets/images/profile_image.png')),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddJob()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
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
                                ));

                            // Get.toNamed(JobDetailsScreen.route, arguments: jobLists[index]['title']);
                          }));
                }
              }),
        ]),
      ),
    );
  }
}
