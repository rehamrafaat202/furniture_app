import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/user_model.dart';
import './body.dart';

class CheckOutScreen extends StatelessWidget {
  final UserModel data;
  const CheckOutScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(data: data),
    );
  }
}
