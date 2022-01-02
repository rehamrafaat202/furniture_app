import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/check_out/check_out_screen.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/screens/cart/components/all_cart.dart';
import 'package:furniture_shop_app/widgets/checkout_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Shopping Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                    horizontal: BorderSide(color: containerBorder, width: 2))),
            child: const AllCarts(),
          ),
          CheckOutButton(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckOutScreen()));
            },
          )
        ],
      ),
    );
  }
}
