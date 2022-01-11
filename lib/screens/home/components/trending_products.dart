import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/trending_model.dart';
import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';
import 'package:furniture_shop_app/screens/product_details/product_details_screen.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  TrendingRepository repo = TrendingRepository();
  List<TrendingModel> trending = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.displayTrending(),
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
              trending = snapshot.data as List<TrendingModel>;
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 20),
                              height: 130,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: containerGround),
                              child: Hero(
                                tag: trending[index].img!,
                                child: Image.network(
                                  trending[index].img!,
                                ),
                              )),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trending[index].title!,
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
                                    "\$${trending[index].price!}",
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
                                              builder: (context) =>
                                                  ProductDetailsScreen(
                                                      trending:
                                                          trending[index])));
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
        });
  }
}
