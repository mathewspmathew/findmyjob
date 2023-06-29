import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants.dart';

class PermanentJobsPage extends StatelessWidget {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descrcontroller = TextEditingController();

  Future<String?> getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getCurrentUserId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kScaffoldBackgroundColor,
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                'Discover',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Error state
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kScaffoldBackgroundColor,
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                'Job Informations',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final userId = snapshot.data;
          final bool isSpecificUser = userId == 'SLfGdDVGyOPncfgzvRnM5n17mvI2';

          return Scaffold(
            appBar: AppBar(
              backgroundColor: kScaffoldBackgroundColor,
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                'Job Information',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            floatingActionButton: isSpecificUser
                ? Container(
                    width: 100,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                              heightFactor: 0.5,
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView(
                                    children: [
                                      TextField(
                                        controller: titlecontroller,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Title',
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      TextField(
                                        controller: descrcontroller,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Description',
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          CollectionReference jobRef =
                                              FirebaseFirestore.instance
                                                  .collection('permanentjobs');
                                          jobRef.add(
                                            {
                                              'jobtitle': titlecontroller.text,
                                              'jobdescr': descrcontroller.text
                                            },
                                          );
                                        },
                                        child: Text('Submit'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: Color.fromARGB(255, 13, 71, 161),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        ' Add ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : null,
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('permanentjobs')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading state
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Error state
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data.docs[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius here
                        ),
                        child: Container(
                          color: Color.fromARGB(
                              255, 7, 3, 54), // Update the color here
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(documentSnapshot['jobtitle']),
                                SizedBox(height: 5),
                                Text(documentSnapshot['jobdescr']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
