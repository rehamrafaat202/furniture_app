import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/page_view_model.dart';
import 'package:furniture_shop_app/screens/auth/welcome_screen.dart';
import 'package:furniture_shop_app/screens/on_boarding/image_view.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  void submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var boardingController = PageController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardingController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                // print(index);
                if (index == items.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) => ImageView(model: items[index]),
              itemCount: items.length,
            ),
          ),
          Container(
            height: 100,
            child: Column(
              children: [
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        activeDotColor: primaryColor,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0),
                    controller: boardingController,
                    count: items.length),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          submit();
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(
                              color: scendryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                    Container(
                      width: 180,
                      child: ContainerButton(
                          color: primaryColor,
                          txtColor: Colors.white,
                          title: "Next",
                          submit: () {
                            if (isLast) {
                              submit();
                            }
                            boardingController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
