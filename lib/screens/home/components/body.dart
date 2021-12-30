import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/home_model.dart';
import 'package:furniture_shop_app/screens/home/components/black_friday.dart';
import 'package:furniture_shop_app/screens/home/components/discover_list.dart';
import 'package:furniture_shop_app/screens/home/components/trending.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 18.0,
            ),
            const DiscoverList(),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              children: [
                const Text(
                  "Trending",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Spacer(),
                InkWell(
                  child: Row(
                    children: const [
                      Text("Show All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            TrendingWidget(),
            const SizedBox(
              height: 30.0,
            ),
            BlackFriday()
          ],
        ),
      ),
    );
  }
}
