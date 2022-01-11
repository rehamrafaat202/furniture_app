// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:furniture_shop_app/models/trending_model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TrendingRepository {
  TrendingRepository();
  File? profileImage;

  final picker = ImagePicker();
  TrendingModel? trendingModel;
  Future getImage({getState, context}) async {
    final picked = await picker.getImage(source: ImageSource.gallery);
    getState();
    if (picked != null) {
      profileImage = File(picked.path);
    }
  }

  Future<TrendingModel> addTrendingFurniture(
      {TrendingModel? model, addLoading, context}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("trending")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.img = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("trending").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      trendingModel = TrendingModel.fromJson(json);

      trendingModel!.id = event.snapshot.key;
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }
    print(trendingModel!.items);
    return trendingModel!;
  }

  Future<List<TrendingModel>> displayTrending() async {
    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("trending").orderByKey();
    List<TrendingModel> needs = [];

    Map? content;
    await needsSnapshot.once().then((value) {
      content = value.snapshot.value as Map<dynamic, dynamic>;
    }).then((value) {});
    content!.forEach((key, value) {
      trendingModel = TrendingModel.fromJson(value);
      needs.add(trendingModel!);
    });

    return needs;
  }
}
