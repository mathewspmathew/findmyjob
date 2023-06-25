import 'package:flutter/material.dart';
import 'package:findmyjob/views/widgets/findmyjob_button.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailsScreen extends StatefulWidget {
  static const route = '/job-details';

  final String? jobTitle;
  final String? description;
  final String? salary;
  final String? selectPanchayath;
  final String? selectDistrict;
  final String? posteddate;
  final String? phoneNumber;
  final String? profimg;

  const JobDetailsScreen(
      {super.key,
      this.jobTitle,
      this.description,
      this.salary,
      this.selectPanchayath,
      this.phoneNumber,
      this.selectDistrict,
      this.posteddate,
      this.profimg,
      });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
 
  @override
  Widget build(BuildContext context) {
    Future<void> launchPhoneDialer(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobTitle.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(
                          radius: 110,
                          backgroundImage: NetworkImage(widget.profimg.toString())),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.jobTitle.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    widget.selectPanchayath.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.selectDistrict.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Posted on ${widget.posteddate}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: const Text('Full-Time'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(widget.salary.toString())
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Job Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),
                  ...[widget.description].map(
                    (e) => ListTile(
                      title: Center(
                        child: Text(
                          e.toString(),
                        ),
                      ),
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      minLeadingWidth: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: findmyjobButton(
                  title: 'Apply',
                  onPressed: () {
                    launchPhoneDialer(widget.phoneNumber.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
