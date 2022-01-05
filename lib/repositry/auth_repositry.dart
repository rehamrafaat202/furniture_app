import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/user_model.dart';

class AuthRepositry {
  AuthRepositry();

  Future<UserModel> userRegister(
      {required UserModel model,
      emailController,
      passwordController,
      addLoading,
      data,
      context}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("users").child(value.user!.uid);
        await ref.set(model.toMap());
        DatabaseEvent event = await ref.once();
        final json = event.snapshot.value as Map<dynamic, dynamic>;
        data = UserModel.fromJson(json);
        print('=====${data!.email}');
        return value;
      });
      print(result.user);
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text(' Ops! Registration Failed'),
              content: Text('${e.message}')));
    }
    print(data!.address);
    return data!;
  }

  Future<UserModel> userLogin(
      {emailController, passwordController, data, context, addLoading}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("users").child(value.user!.uid);
        DatabaseEvent event = await ref.once();
        final json = event.snapshot.value as Map<dynamic, dynamic>;
        data = UserModel.fromJson(json);

        return value;
      });
    } on FirebaseAuthException catch (e) {
      addLoading();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text(' Ops! Login Failed'),
              content: Text('${e.message}')));
    }

    return data!;
  }
}
