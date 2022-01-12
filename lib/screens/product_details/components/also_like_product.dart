import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/also_like_model.dart';

import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/style.dart';

class AlsoLike extends StatefulWidget {
  String? productId;
  AlsoLike({required this.productId, Key? key}) : super(key: key);

  @override
  State<AlsoLike> createState() => _AlsoLikeState();
}

class _AlsoLikeState extends State<AlsoLike> {
  TrendingRepository repository = TrendingRepository();

  List<AlsoLikeModel> also = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repository.displayAlsoLike(productId: widget.productId),
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
              also = snapshot.data as List<AlsoLikeModel>;
              return Container(
                padding: const EdgeInsets.all(
                  20.0,
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: containerBorder, width: 2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "You may also like",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: also.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                right: 20,
                              ),
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      also[index].image!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: containerGround),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              );
            }
          }
        });
  }
}
