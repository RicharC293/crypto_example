import 'package:crypto_example/app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen/login_screen.dart';
import '../screens/sign_up_screen/sign_up_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

final routes = {
  WelcomeScreen.routeName: (BuildContext context) => const WelcomeScreen(),
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  SignUpScreen.routeName: (BuildContext context) => const SignUpScreen(),
  HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
};
