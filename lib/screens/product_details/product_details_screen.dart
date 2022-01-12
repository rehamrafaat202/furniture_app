import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/trending_model.dart';
import 'package:furniture_shop_app/screens/add_collection/also_like_collection.dart';
import 'package:furniture_shop_app/screens/product_details/components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  TrendingModel trending;
  ProductDetailsScreen({required this.trending, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
          product: trending,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AlsoLikeScreen(productId: trending.id)));
          },
        ));
  }
}
