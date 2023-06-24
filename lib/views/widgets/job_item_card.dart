import 'package:flutter/material.dart';
import 'package:findmyjob/views/screens/job_details_screen.dart';
import 'findmyjob_button.dart';

class JobItemCard extends StatelessWidget {
  final String? jobs;
  final String? jobTitle;
  final String? jobsLogoUrl;
  final Widget widget;
  const JobItemCard({
    Key? key,
    this.jobs,
    required this.widget,
    this.jobTitle,
    this.jobsLogoUrl,
 
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
            jobsLogoUrl!,
            width: 64,
            height: 54,
          ),
          Text(
            jobs!,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            jobTitle!,
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
                  context, MaterialPageRoute(builder: (context) => widget))),
        ],
      ),
    );
  }
}
