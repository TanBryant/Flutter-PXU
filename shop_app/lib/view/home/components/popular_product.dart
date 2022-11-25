import 'package:flutter/material.dart';
import 'package:shop_app/view/home/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../../../provider/cartProvider.dart';
import '../../../provider/productProvider.dart';
import '../../../size_config.dart';
import '../../details/details-screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getListProduct();
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartList();
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Sản phẩm phổ biến", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          children: [
            ...productProvider.listProduct.map(
              (e) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Card(
                    margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(
                            e.image!,
                            width: 100,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                e.title!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(e.price!),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () {
                                  cartProvider.addCart(e);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                child: const Text('Add to Cart')),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
