import 'package:findmyjob/views/widgets/joblist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class AppliedJobsScreen extends StatelessWidget {
  static const route = '/applied-jobs';


  const AppliedJobsScreen({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Jobs'),
        centerTitle: true,
         backgroundColor: kScaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applied jobs',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appliedjobs.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> item = appliedjobs[index];
    final String title = item['jobtitle'];
    final String description = item['description'];
                  return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.white.withOpacity(0.15),
                  child: ListTile(
                    title: Text(
                      title.toString(),
                      style: Get.textTheme.bodyText1?.copyWith(fontSize: 16),
                    ),
                    subtitle: Text(
                      description.toString(),
                      style: Get.textTheme.bodyText1?.copyWith(fontSize: 16),
                    ),
                  ),
                );},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
