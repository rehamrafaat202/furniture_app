import 'package:flutter/material.dart';

import 'package:furniture_shop_app/models/home_model.dart';
import 'package:furniture_shop_app/screens/cart/cart_screen.dart';
import 'package:furniture_shop_app/screens/product_details/components/also_like_product.dart';
import 'package:furniture_shop_app/screens/product_details/components/colors_widget.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_description.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_image.dart';
import 'package:furniture_shop_app/screens/product_details/components/review.dart';
import 'package:furniture_shop_app/screens/product_details/components/similar_item.dart';
import 'package:furniture_shop_app/screens/product_details/components/product_rate.dart';
// import 'package:furniture_shop_app/shared_component_btw_screen.dart/container_button.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Trending? product;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            ProductImage(
              imge: product!.img,
              type: product!.type,
            ),
            TitleWithRate(
              title: product!.title,
              price: product!.price,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ColorsWidget(),
            const SizedBox(
              height: 10.0,
            ),
            AlsoLike(
              x: product!.items,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Description(
              description: product!.description,
              sku: product!.sku,
              categories: product!.categories,
              dimensions: product!.dimensions,
              tags: product!.tags,
            ),
            const Review(),
            const SizedBox(
              height: 10.0,
            ),
            SimilarItem(
              similar: product!.similar,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ContainerButton(
                  title: "Add to cart".toUpperCase(),
                  submit: () {},
                  color: const Color(0xff242A37),
                  txtColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
