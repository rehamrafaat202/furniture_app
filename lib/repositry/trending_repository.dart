// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/also_like_model.dart';

import 'package:furniture_shop_app/models/trending_model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TrendingRepository {
  TrendingRepository();
  File? profileImage;
  AlsoLikeModel? alsoLikeModel;

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

    return trendingModel!;
  }

  Future<List<TrendingModel>> displayTrending() async {
    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("trending").orderByKey();
    List<TrendingModel> needs = [];

    Map? content;
    try {
      await needsSnapshot.once().then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      }).then((value) {});
      content!.forEach((key, value) {
        trendingModel = TrendingModel.fromJson(value);
        trendingModel!.id = key;
        needs.add(trendingModel!);
      });
    } catch (e) {
      print(e);
    }
    return needs;
  }

  Future<AlsoLikeModel> addAlsoLike(
      {AlsoLikeModel? model, addLoading, context}) async {
    try {
      var frebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref("also-like")
          .child(Uri.file(profileImage!.path).pathSegments.last);

      var uploadTask = frebaseStorageRef.putFile(profileImage!);
      var storageSnapShot = await uploadTask.whenComplete(() {});

      model!.image = await storageSnapShot.ref.getDownloadURL();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("also-like").push();

      await ref.set(model.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      alsoLikeModel = AlsoLikeModel.fromJson(json);

      alsoLikeModel!.id = event.snapshot.key;
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Upload Furniture Failed'),
              content: Text('${e.message}')));
    }

    return alsoLikeModel!;
  }

  Future<List<AlsoLikeModel>> displayAlsoLike({productId}) async {
    List<AlsoLikeModel> needs = [];

    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("also-like");

    Map? content;
    try {
      await needsSnapshot
          .orderByChild("productId")
          .equalTo(productId)
          .once()
          .then((value) {
        content = value.snapshot.value as Map<dynamic, dynamic>;
      });

      content!.forEach((key, value) {
        alsoLikeModel = AlsoLikeModel.fromJson(value);
        needs.add(alsoLikeModel!);
      });
    } catch (e) {
      print("no data add yet");
    }

    return needs;
  }
}
