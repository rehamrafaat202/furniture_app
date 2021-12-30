import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class DiscoverList extends StatelessWidget {
  const DiscoverList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: home[0].discover!.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffDBDBCC)),
                      child: Image.network(
                        home[0].discover![index].img,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: Text(
                    home[0].discover![index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${home[0].discover![index].numOfItems} items",
                      style: TextStyle(
                          color: Color(0xffDBDBCC),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            );
          }),
    );
  }
}
