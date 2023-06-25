import 'package:flutter/material.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImageTag = 'profileImage';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: AlertDialog(
              title: Text('Profile'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: profileImageTag,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text('Profile Picture'),
                                  backgroundColor: Colors.grey,
                                ),
                                body: Center(
                                  child: Hero(
                                    tag: profileImageTag,
                                    child: CircleAvatar(
                                      radius: 150.0,
                                      backgroundImage: AssetImage(
                                          'assets/profile_image.png'),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/profile_image.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  OutlinedButton(
                    child: Text('View Profile'),
                    onPressed: () {
                      // Perform action when "View Profile" button is pressed
                      // For example, navigate to the user's profile screen
                    },
                  ),
                  SizedBox(height: 8.0),
                  OutlinedButton(
                    child: Text('Log Out'),
                    onPressed: () {
                      // Perform action when "Log Out" button is pressed
                      // For example, log out the user and navigate to the login screen
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.0),
            ),
          ),
          centerTitle: true,
          title: Text(' Profile'),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.transparent,
            constraints: BoxConstraints.expand(),
          ),
          Center(
            child: Text('Home Profile Content'),
          ),
        ],
      ),
    );
  }
}
