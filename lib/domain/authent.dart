import 'package:firebase_auth/firebase_auth.dart';

Future<bool> loginUser(
    {required String email, required String password}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Login successful, do something with userCredential.user
    print('Login successful: ${userCredential.user!.email}');
    return true;
    // Navigate to the home page or perform any other action
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found with this email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    } else {
      print('Login failed. Error: ${e.code}');
    }
  } catch (e) {
    print('Login failed. Error: $e');
  }
  return false;
}

Future<bool> signUpWithEmailAndPassword(
    {required String email, required String password}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Additional actions after successful sign-up
    // For example, you can save user data to Firestore or perform other tasks

    print('Sign up successful: ${userCredential.user!.uid}');
    return true;
    
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else {
      print('Sign up failed. Error: ${e.message}');
    }
  } catch (e) {
    print('Sign up failed. Error: $e');
  }
  return false;
}
