import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      //   child: CustomAppBar(rating: agrs.product.rating),
      // ),
      body: Body(product: agrs.product),
    );
  }
}

// Chúng tôi cũng cần chuyển sản phẩm của mình đến màn hình chi tiết
// And we use name route so create a arguments class
class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
