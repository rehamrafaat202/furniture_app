import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/page_view_model.dart';
import 'package:furniture_shop_app/style.dart';

class ImageView extends StatelessWidget {
  final PagesViewModel model;
  const ImageView({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  model.image,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
                shadows: [
                  Shadow(
                    offset: Offset(0, 0.3),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(0, 0.3),
                    blurRadius: 8.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
          ),
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
