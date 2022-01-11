import 'package:flutter/material.dart';

import 'package:furniture_shop_app/models/cart_model.dart';
import 'package:furniture_shop_app/repositry/cart_repository.dart';
import 'package:furniture_shop_app/screens/cart/components/cart_item.dart';
import 'package:furniture_shop_app/style.dart';

class AllCarts extends StatefulWidget {
  const AllCarts({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCarts> createState() => _AllCartsState();
}

class _AllCartsState extends State<AllCarts> {
  CartRepository repository = CartRepository();
  List<CartModel> cart = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repository.displayCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.data}');
            } else {
              cart = snapshot.data as List<CartModel>;
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cart.length} items",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
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
        });
  }
}
