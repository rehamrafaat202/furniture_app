// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/best_selling_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SellingRepository {
  SellingRepository();
  File? profileImage;

  final picker = ImagePicker();
  BestSellingModel? bestSellingModel;
  Future getImage({getState, context}) async {
    final picked = await picker.getImage(source: ImageSource.gallery);
    getState();
    if (picked != null) {
      profileImage = File(picked.path);
    }
  }

  Future<BestSellingModel> addBestSellingFurniture(
      {BestSellingModel? model, addLoading, context}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("best-selling")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("best-selling").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      bestSellingModel = BestSellingModel.fromJson(json);
      bestSellingModel!.id = event.snapshot.key;
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return bestSellingModel!;
  }

  Future<List<BestSellingModel>> displaySelling() async {
    Query needsSnapshot = FirebaseDatabase.instance
        .ref("Home")
        .child("best-selling")
        .orderByKey();
    List<BestSellingModel> needs = [];

    Map? content;
    try {
      await needsSnapshot.once().then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      }).then((value) {});
      content!.forEach((key, value) {
        bestSellingModel = BestSellingModel.fromJson(value);
        needs.add(bestSellingModel!);
      });
    } catch (e) {
      print(e);
    }
    return needs;
  }
}
