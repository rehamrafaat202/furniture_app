import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/discover_model.dart';
import 'package:furniture_shop_app/repositry/furniture_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class DiscoverList extends StatelessWidget {
  List<DiscoverModel> model = [];
  DiscoverList({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(model[0].title!);
    // print(repository.model[0].title);
    return Container(
      height: 250,
      margin: const EdgeInsets.only(right: 10),
      child: model.isEmpty
          ? Container(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: primaryColor),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.black38,
                    child: const Text(
                      "No items added yet",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: model.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(
                                model[index].img!,
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Text(
                        model[index].title!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("${model[index].numOfItems!} items",
                          style: const TextStyle(
                              color: containerGround,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                );
              }),
    );
  }
}
