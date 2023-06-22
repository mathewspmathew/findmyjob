import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applied Jobs'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const 
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
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.white.withOpacity(0.15),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    // child: Image.network(
                    //   'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png',
                    //   width: 48,
                    //   height: 48,
                    // ),
                    child: CircleAvatar(),
                  ),
                  title: Text(
                    'Catering',
                    style: Get.textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                  subtitle: Text(
                    'Sandhya caters',
                    style: Get.textTheme.titleMedium?.copyWith(fontSize: 12),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
