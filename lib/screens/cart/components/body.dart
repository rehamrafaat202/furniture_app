import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/cart_model.dart';
import 'package:furniture_shop_app/models/user_model.dart';
import 'package:furniture_shop_app/repositry/cart_repository.dart';
import 'package:furniture_shop_app/screens/check_out/check_out_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/screens/cart/components/all_cart.dart';
import 'package:furniture_shop_app/widgets/checkout_button.dart';

class Body extends StatefulWidget {
  final UserModel data;
  const Body({required this.data, Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              return cart.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Your Cart Is Empty",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Image.asset(
                          "assets/images/purchase.png",
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Shopping Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 20.0),
                            decoration: const BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: containerBorder, width: 2))),
                            child: AllCarts(cart: cart),
                          ),
                          CheckOutButton(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CheckOutScreen(data: widget.data)));
                            },
                          )
                        ],
                      ),
                    );
            }
          }
        });
  }
}
