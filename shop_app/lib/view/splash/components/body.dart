// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/view/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../../component/default_button.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Chúng tôi đem đến\ntrại nghiệm tuyệt vời cho ban.",
      "image": "assets/images/thudong.png",
    },
    {
      "text":
          "Chúng tôi giúp mọi người kết nối với cửa hàng \n Trên khắp mọi miền tổ quốc",
      "image": "assets/images/logo-ivy.png"
    },
    {
      "text": "Chúng tôi đem đến  \n trại nghiệm tuyệt vời cho ban.",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  DefaultButton(
                    text: "Hãy vào trong của hàng nào!",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromARGB(255, 49, 226, 18)
            : Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
