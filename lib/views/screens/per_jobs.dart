import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PermanentJobsPage extends StatelessWidget {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descrcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: Container(
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
                              decoration: InputDecoration(
                                labelText: 'Title',
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              controller: descrcontroller,
                              decoration: InputDecoration(
                                labelText: 'Description',
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                CollectionReference jobRef = FirebaseFirestore
                                    .instance
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
            backgroundColor: Colors.blue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              ' Add ',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('permanentjobs')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, Index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[Index];
                  return Card(
                    child: Container(
                      color: Colors.black26,
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
                });
          },
        ));
  }
}
