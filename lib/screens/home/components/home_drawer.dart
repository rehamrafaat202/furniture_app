import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/screens/cart/cart_screen.dart';
import 'package:furniture_shop_app/screens/filters/filter_screen.dart';
import 'package:furniture_shop_app/screens/home/home_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 10),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xffEDE4EB),
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gregory Bates",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      const Text(
                        "rehamrafaat202@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
              child: Column(
            children: [
              defaultdrawerWidgets(
                  icn: Icons.home,
                  title: "Home",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }),
              defaultdrawerWidgets(
                  icn: Icons.queue_rounded,
                  title: "New Collections",
                  press: () {}),
              defaultdrawerWidgets(
                  icn: Icons.filter_alt_rounded,
                  title: "Filters",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilteersScreen()));
                  }),
              defaultdrawerWidgets(
                  icn: Icons.bookmark_rounded,
                  title: "Editor's Picks",
                  press: () {}),
              defaultdrawerWidgets(
                  icn: Icons.local_offer, title: "Top Deals", press: () {}),
              defaultdrawerWidgets(
                  icn: Icons.shopping_cart,
                  title: "Your cart",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  }),
              defaultdrawerWidgets(
                  icn: Icons.notifications,
                  title: "Notifications",
                  press: () {}),
              defaultdrawerWidgets(
                  icn: Icons.settings, title: "Settings", press: () {})
            ],
          ))
        ],
      ),
    );
  }

  Widget defaultdrawerWidgets({icn, title, press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Icon(
            icn,
            color: icnColor,
          ),
          TextButton(
              onPressed: press,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.black87),
              ))
        ],
      ),
    );
  }
}
