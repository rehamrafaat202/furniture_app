// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/discover_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FurnitureRepository {
  FurnitureRepository();
  File? profileImage;
  List<DiscoverModel> model = [];
  // List<Need> _needs = [];

  final picker = ImagePicker();
  DiscoverModel? discoverModel;
  Future getImage({getState, context}) async {
    final picked = await picker.getImage(source: ImageSource.gallery);
    getState();
    if (picked != null) {
      profileImage = File(picked.path);
    }
  }

  Future<DiscoverModel> addFurnitureDiscover(
      {DiscoverModel? model, addLoading, context}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("discover")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("discover").push();

      await ref.set(model.toMap());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      discoverModel = DiscoverModel.fromJson(json);
      discoverModel!.id = event.snapshot.key;
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return discoverModel!;
  }

  Future<List<DiscoverModel>> displayDiscover() async {
    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("discover").orderByKey();
    List<DiscoverModel> needs = [];

    Map? content;
    await needsSnapshot.once().then((value) {
      content = value.snapshot.value as Map<dynamic, dynamic>;

      // print(content);
    });
    content!.forEach((key, value) {
      discoverModel = DiscoverModel.fromJson(value);
      needs.add(discoverModel!);
    });
    // print(needs.length);
    return needs;
    // return needs;
  }
}
