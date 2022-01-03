import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/home/components/body.dart';
import 'package:furniture_shop_app/screens/home/components/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  final String? email;
  const HomeScreen({this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.lock_sharp),
          ),
        ],
      ),
      drawer: HomeDrawer(email: email),
      body: const Body(),
    );
  }
}