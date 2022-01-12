import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/trending_model.dart';
import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/style.dart';
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
              return trending.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(right: 20, bottom: 20),
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: containerGround),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.black38,
                          child: const Text(
                            "No items added yet",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ))
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: banner,
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Hero(
                                tag: trending[index].img!,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    trending[index].img!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                                  trending[
                                                                      index])));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              width: 120,
                                              color: Colors.black,
                                              child: const Text(
                                                "Shop",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              )
                            ]));
                      },
                    );
            }
          }
        });
  }
}
