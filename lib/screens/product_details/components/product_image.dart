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
    return Container(
      height: 560,
      color: const Color(0xffDBDBCC),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
          Expanded(
            child: Hero(
              tag: imge,
              child: Image.network(
                imge,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
