import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: home[0].trending!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    height: 130,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffDBDBCC)),
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
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${home[0].trending![index].price}",
                          style: TextStyle(
                            color: Color(0xffDBDBCC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 90,
                          color: Colors.black,
                          child: Text(
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
              margin: EdgeInsets.only(left: 120, bottom: 10),
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
