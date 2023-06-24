import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessStorage extends ChangeNotifier {
  List get imageUrl => _image;
  List _image = [];
  File? _imagePath;

  Future<void> getAccess(context) async {
    final access = await [Permission.camera, Permission.storage].request();
    final cameraStatus = access[Permission.camera];
    final storageStatus = access[Permission.storage];
    if (storageStatus != PermissionStatus.granted ||
        cameraStatus != PermissionStatus.granted) {
      ScaffoldMessenger(child: Text('error'));
      //throw const SnackBar(content: Text('error'));
    }

    notifyListeners();
  }

  void chooseFromStorage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _imagePath = File(pickedFile.path);
      notifyListeners();
    }
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _imagePath = File(pickedFile.path);
      _image.add(_imagePath);
      // ignore: unnecessary_null_comparison
      if (pickedFile == null) return;
      //Import dart:core

      /*Step 2: Upload to Firebase storage*/
      //Install firebase_storage
      //Import the library

      //     //Get a reference to storage root
      //     Reference referenceRoot = FirebaseStorage.instance.ref();
      //     Reference referenceDirImages = referenceRoot.child('Profile images');

      //     //Create a reference for the image to be stored
      //     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      //     Reference referenceImageToUpload = referenceDirImages.child(fileName);

      //     //Handle errors/success
      //     try {
      //       //Store the file
      //       await referenceImageToUpload.putFile(File(_image!.path));
      //       //Success: get the download URL
      //       _imageUrl = await referenceImageToUpload.getDownloadURL();
      //     } catch (error) {
      //       //Some error occurred
      //     }
      //   }
      //   print('The is the path ${_image}');
      //   notifyListeners();
      // }
    }
  }
}
