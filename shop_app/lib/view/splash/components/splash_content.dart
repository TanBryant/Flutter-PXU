import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "IVY Moda",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(50),
            color: Color.fromRGBO(62, 207, 0, 1),
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 3),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(350),
        ),
      ],
    );
  }
}
