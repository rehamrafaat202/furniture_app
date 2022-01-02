import 'package:flutter/material.dart';
import 'package:furniture_shop_app/style.dart';

class AlsoLike extends StatelessWidget {
  var x;
  AlsoLike({required this.x, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: containerBorder, width: 2))),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "You may also like",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                itemCount: x.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      // height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: containerGround),
                      child: Image.network(
                        x[index],
                      ));
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
