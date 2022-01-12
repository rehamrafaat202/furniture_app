import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/user_model.dart';
import 'package:furniture_shop_app/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  final UserModel data;
  const CartScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        actions: [TextButton(onPressed: () {}, child: const Text("Edit"))],
      ),
      body: Body(data: data),
    );
  }
}
