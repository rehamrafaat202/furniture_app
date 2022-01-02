import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: home[0].collections!.length,
        itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(10),
            width: 320,
            // height: 270,
            decoration: BoxDecoration(
              color: banner,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Stack(children: [
              Positioned(
                right: 10.0,
                child: Image.network(
                  home[0].collections![index].img,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Collection",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(home[0].collections![index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                        )),
                    const Spacer(),
                    Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text("Shop now".toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Icon(Icons.arrow_right)
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
