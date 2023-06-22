import 'package:flutter/material.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'findmyjob_button.dart';

class JobItemCard extends StatelessWidget {
  final String jobs;
  final String jobTitle;
  final String jobsLogoUrl;
  final String? description;
  final String? salary;
  final String? phoneNumber;
  final String? district;
  final String? panchayat;
  final String? posteddate;
  const JobItemCard({
    Key? key,
    required this.jobs,
    required this.jobTitle,
    this.phoneNumber,
    required this.jobsLogoUrl,
    this.description,
    this.salary,
    this.district,
    this.panchayat,
     this.posteddate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 150,
      width: 80,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            jobsLogoUrl,
            width: 64,
            height: 54,
          ),
          Text(
            jobs,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            jobTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          findmyjobButton(
              title: 'Apply',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDetailsScreen(
                            jobTitle: jobTitle,
                            description: description,
                            salary: salary,
                            selectDistrict: district,
                            selectPanchayath: panchayat,
                            posteddate: posteddate,
                            phoneNumber: phoneNumber,
                          )))),
        ],
      ),
    );
  }
}
