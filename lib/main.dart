import 'package:flutter/material.dart';
import 'package:login_page/Screen/Home/Provider/HomeScreenProvider.dart';
import 'package:login_page/Screen/Home/View/HomeScreen.dart';
import 'package:login_page/Screen/Login/Provider/LoginScreenProvider.dart';
import 'package:login_page/Screen/Login/View/LoginScreen.dart';
import 'package:login_page/Screen/SignUp/Provider/SignUpScreenProvider.dart';
import 'package:login_page/Screen/SignUp/View/SignUpScreen.dart';
import 'package:login_page/Screen/Sples/View/SplesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplesScreen(),
          'login': (context) => const LoginScreen(),
          'signup': (context) => const SignUpScreen(),
          'home':(context) => const HomeScreen(),
        },
      ),
    ),
  );
}
