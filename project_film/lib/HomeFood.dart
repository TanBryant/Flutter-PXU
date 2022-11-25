import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeFood extends StatelessWidget {
  HomeFood({Key? key}) : super(key: key);
  List<String> _list = [
    'assets/images/YoshimasaSushi1.png',
    'assets/images/YoshimasaSushi2.png',
    'assets/images/YoshimasaSushi3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListIcon(context),
            SizedBox(
              height: 20,
            ),
            buildHeaderTitle(context),
            SizedBox(
              height: 20,
            ),
            buildThumbnail(context),
            SizedBox(
              height: 20,
            ),
            buildMainFood(context),
          ],
        ),
      ),
    ));
  }

  buildListIcon(contex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  buildHeaderTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Special",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: Text(
            "CART",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ],
    );
  }

  buildThumbnail(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Find put what's cooking today!",
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          )),
    );
  }

  buildMainFood(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
          color: Colors.blueAccent,
          height: 250,
          width: 180,
          child: Column(
            children: [
              Image.asset(
                'assets/images/YoshimasaSushi1.png',
                height: 100,
              ),
              Text(
                "Yoshimasa Sushi",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Row(),
            ],
          ),
        ),
      ],
    );
  }
}
