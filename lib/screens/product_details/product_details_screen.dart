import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/trending_model.dart';
import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/screens/add_collection/also_like_collection.dart';
import 'package:furniture_shop_app/screens/product_details/components/body.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  TrendingModel trending;
  ProductDetailsScreen({required this.trending, Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<TrendingRepository>(context, listen: false).also.length);
    return Scaffold(
        body: Body(
          product: widget.trending,
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
                        AlsoLikeScreen(productId: widget.trending.id)));
            //     .then((value) {
            //   setState(() {});
            // });
          },
        ));
  }
}
