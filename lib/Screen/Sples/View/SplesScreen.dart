import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Utils/shared_preferences.dart';

class SplesScreen extends StatefulWidget {
  const SplesScreen({Key? key}) : super(key: key);

  @override
  State<SplesScreen> createState() => _SplesScreenState();
}

class _SplesScreenState extends State<SplesScreen> {
  @override
  Widget build(BuildContext context) {
    CheckLogin();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xff491716),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xff491716),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "Assets/Images/1.png",
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Coffee Shop",
                    style: GoogleFonts.libreFranklin(
                      color: Color(0xff491716),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> CheckLogin() async {
    Shr shr = Shr();

    Map m1 = await shr.readData();

    if (m1['l1'] == true) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, 'home');
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, 'login');
      });
    }
  }
}
