import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/best_selling_model.dart';
import 'package:furniture_shop_app/repositry/selling_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({Key? key}) : super(key: key);

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  SellingRepository repo = SellingRepository();
  List<BestSellingModel> sell = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.displaySelling(),
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
              sell = snapshot.data as List<BestSellingModel>;
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sell.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    right: 20, bottom: 20),
                                height: 130,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: containerGround),
                                child: Image.network(
                                  sell[index].img!,
                                )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sell[index].title!,
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
                                      sell[index].price!,
                                      style: const TextStyle(
                                        color: containerGround,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
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
                  });
            }
          }
        });
  }
}
