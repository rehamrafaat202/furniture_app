import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/page_view_model.dart';
import 'package:furniture_shop_app/screens/login/login_layout_screen.dart';
import 'package:furniture_shop_app/screens/on_boarding/components/body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var boardingController = PageController();
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f6),
      body: SafeArea(
        child: PageView.builder(
          controller: boardingController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            print(index);
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
          itemBuilder: (context, index) => Body(
              model: items[index],
              boardingController: boardingController,
              isLast: isLast,
              index: index),
          itemCount: items.length,
        ),
      ),
    );
  }
}
