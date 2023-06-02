import 'package:flutter/material.dart';

class ProductPoster extends StatelessWidget {
  ProductPoster({Key? key, required this.size, required this.image})
      : super(key: key);

  Size size;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      // the height of this container is 80% of our width
      height: size.width * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.network(
            image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
