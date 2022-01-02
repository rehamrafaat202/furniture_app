import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.imge,
    required this.type,
  }) : super(key: key);

  final String imge;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 270,
          color: const Color(0xffDBDBCC),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconButton(
              //     onPressed: () => Navigator.pop(context),
              //     icon: Icon(Icons.arrow_back)),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
              Text(
                type,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
        ),
        Positioned(top: 70, left: 20, child: Image.network(imge))
        // ,
      ],
    );
  }
}
