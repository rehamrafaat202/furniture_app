import 'package:flutter/material.dart';

import 'package:furniture_shop_app/models/cart_model.dart';
import 'package:furniture_shop_app/screens/cart/components/cart_item.dart';

class AllCarts extends StatelessWidget {
  const AllCarts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${cart.length} items",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cart: cart[index],
                );
              }),
        ],
      ),
    );
  }
}
