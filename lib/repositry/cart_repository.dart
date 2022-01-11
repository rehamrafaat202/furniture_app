// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/cart_model.dart';

class CartRepository {
  CartRepository();
  File? profileImage;

  CartModel? cartModel;
  Future<CartModel> addToCart({CartModel? model, addLoading, context}) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Home").child("your-cart").push();

      await ref.set(model!.toJson());
      DatabaseEvent event = await ref.once();
      final json = event.snapshot.value as Map<dynamic, dynamic>;

      cartModel = CartModel.fromJson(json);

      cartModel!.id = event.snapshot.key;
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text(' Ops! Furniture Failed'),
              content: Text('${e.message}')));
    }

    return cartModel!;
  }

  Future<List<CartModel>> displayCart() async {
    Query needsSnapshot =
        FirebaseDatabase.instance.ref("Home").child("your-cart").orderByKey();
    List<CartModel> needs = [];

    Map? content;
    await needsSnapshot.once().then((value) {
      content = value.snapshot.value as Map<dynamic, dynamic>;
    }).then((value) {});
    content!.forEach((key, value) {
      cartModel = CartModel.fromJson(value);
      needs.add(cartModel!);
    });

    return needs;
  }
}
