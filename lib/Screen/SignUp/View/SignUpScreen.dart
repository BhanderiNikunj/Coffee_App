import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Screen/SignUp/Provider/SignUpScreenProvider.dart';
import 'package:login_page/Utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpScreenProvider? signUpScreenProviderTrue;
  SignUpScreenProvider? signUpScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    signUpScreenProviderFalse =
        Provider.of<SignUpScreenProvider>(context, listen: false);
    signUpScreenProviderTrue =
        Provider.of<SignUpScreenProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
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
            Positioned(
              top: 50,
              left: 130,
              child: Image.asset("Assets/Images/1.png"),
            ),
            Positioned(
              top: 230,
              right: 170,
              child: Text(
                "Coffee Shop",
                style: GoogleFonts.libreFranklin(
                  color: Color(0xff491716),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              top: 290,
              left: 170,
              child: Text(
                "Sign Up",
                style: GoogleFonts.libreFranklin(
                  color: Color(0xff491716),
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 20,
              child: Text("Enter Email or Username"),
            ),
            Positioned(
              top: 370,
              left: 20,
              child: Container(
                width: 400,
                height: 50,
                child: TextField(
                  controller: signUpScreenProviderFalse!.txtemail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        gapPadding: 5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: "Ex. user@gmmail.com"),
                ),
              ),
            ),
            Positioned(
              top: 440,
              left: 20,
              child: Text("Enter Email or Username"),
            ),
            Positioned(
              top: 460,
              left: 20,
              child: Container(
                width: 400,
                height: 50,
                child: TextField(
                  controller: signUpScreenProviderFalse!.txtpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      gapPadding: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: "* * * * * * * *",
                  ),
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 170,
              child: InkWell(
                onTap: () {
                  String email = signUpScreenProviderFalse!.txtemail.text;
                  String password = signUpScreenProviderFalse!.txtpassword.text;

                  Shr shr = Shr();
                  shr.CreatData(email, password,false);
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.libreFranklin(
                      color: Color(0xff491716),
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffA48B8B),
                    border: Border.all(color: Color(0xff491716)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "Assets/Images/google.png",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 110,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 30,
                  width: 40,
                  child: Image.asset(
                    "Assets/Images/facebook.png",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 190,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 30,
                  width: 40,
                  child: Image.asset(
                    "Assets/Images/facebook.png",
                  ),
                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
