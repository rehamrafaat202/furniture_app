import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/home_model.dart';
import 'package:furniture_shop_app/screens/product_details/components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Trending? product;
  const ProductDetailsScreen({this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        product: product,
      ),
    );
  }
}
