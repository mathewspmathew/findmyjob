import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'viewbutton.dart';

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

  Future<String?> getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<bool> checkUserInUsersCollection(String userId) async {
    final usersSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .limit(1)
        .get();

    return usersSnapshot.docs.isNotEmpty;
  }

  

  @override
Widget build(BuildContext context) {
  return FutureBuilder<String?>(
    future: getCurrentUserId(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Loading state
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Error state
        return Text('Error: ${snapshot.error}');
      } else {
        final userId = snapshot.data;
        if (userId == 'SLfGdDVGyOPncfgzvRnM5n17mvI2') {
          // Show delete button only for the specific user
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ViewButton(
                      title: 'View',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => widget),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () async {

                        //onDismissed(DismissDirection.endToStart);
                        final isUserExists =
                            await checkUserInUsersCollection(userId!);
                        if (isUserExists) {
                          // User exists in the 'users' collection
                          // Handle delete action here
                        } else {
                          // User does not exist in the 'users' collection
                          // Show an error message or take appropriate action
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          // Hide delete button for other users
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
                ViewButton(
                  title: 'View',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget),
                  ),
                ),
              ],
            ),
          );
        }
      }
    },
  );
}

}
