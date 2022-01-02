import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';
import 'package:furniture_shop_app/screens/product_details/product_details_screen.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: home[0].trending!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    height: 130,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: containerGround),
                    child: Image.network(
                      home[0].trending![index].img,
                    )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      home[0].trending![index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${home[0].trending![index].price}",
                          style: const TextStyle(
                            color: containerGround,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        product: home[0].trending![index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 90,
                            color: Colors.black,
                            child: const Text(
                              "Shop",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 120, bottom: 10),
              width: double.infinity,
              height: 1,
              color: Colors.black12,
            ),
          ],
        );
      },
    );
  }
}
