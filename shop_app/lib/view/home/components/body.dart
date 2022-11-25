import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/view/home/components/categories.dart';
import 'package:shop_app/view/home/components/discount_banner.dart';
import 'package:shop_app/view/home/components/home_header.dart';
import 'package:shop_app/view/home/components/popular_product.dart';
import 'package:shop_app/view/home/components/special_offers.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
