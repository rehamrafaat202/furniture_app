import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class SimilarItem extends StatelessWidget {
  final List<SimilarProduct> similar;
  const SimilarItem({
    required this.similar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      // margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Similar Items",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: similar.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 190,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: primaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                Image.network(
                                  similar[index].img,
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: Text(
                          similar[index].title,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("\$${similar[index].price} ",
                            style: const TextStyle(
                                color: Color(0xffDBDBCC),
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
