import 'package:findmyjob/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProfile extends StatelessWidget {
  HomeProfile({Key? key}) : super(key: key);

  Future<void> _logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(SignUpScreen.route); // Navigate to SignUpScreen
  } catch (e) {
    print('Error during logout: $e');
  }
}


  Future<void> fetchUserData() async {
    try {
      // Get the current user
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('User not logged in');
        return;
      }

      // Get the user document from Firestore
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      if (snapshot.exists) {
        final data = snapshot.data();
        // Access specific fields from the document data
        final lastName = data?['lastName'];
        final firstName = data?['firstName'];

        // Use the fetched data as needed
        print('Last Name: $lastName');
        print('First Name: $firstName');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final CollectionReference<Map<String, dynamic>> usersCollection =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: usersCollection.doc(user!.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.data();
                    final lastName = data?['lastName'];
                    final firstName = data?['firstName'];

                    return Column(
                      children: [
                        Text(
                          lastName ?? '',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          firstName ?? '',
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }

                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color.fromARGB(255, 53, 152, 202),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.account_circle,
                    color: Colors.blueAccent, // Set the icon color to green
                  ),
                ),
                title: const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.blueAccent,
                    // Set the icon color to green
                  ),
                ),
                title: const Text(
                  'Posted Jobs',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.blueAccent, // Set the icon color to green
                  ),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: _logout,
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.3),
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.blueAccent, // Set the icon color to green
                  ),
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
