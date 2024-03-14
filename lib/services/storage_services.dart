import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  UploadTask? _uploadTask;
  Future<String> uploadImage(
      {required String imageFilePath, required String email}) async {
    final storage = FirebaseStorage.instance;
    final filename =
        '$email-${Timestamp.now()}.jpg'; // Generate unique filename
    final reference = storage.ref().child('userImages').child(filename);

    _uploadTask = reference.putFile(File(imageFilePath));
    final snapshot = await _uploadTask!.whenComplete(() => null);

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
