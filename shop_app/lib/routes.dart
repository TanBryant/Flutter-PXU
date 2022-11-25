import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/view/cart/cart_screen.dart';
import 'package:shop_app/view/details/details-screen.dart';
import 'package:shop_app/view/home/home_screen.dart';
import 'package:shop_app/view/login_success/login_success_screen.dart';
import 'package:shop_app/view/sign_in/sign_in_screen.dart';
import 'package:shop_app/view/sign_up/sign_up_screen.dart';
import 'package:shop_app/view/splash/splashh_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
