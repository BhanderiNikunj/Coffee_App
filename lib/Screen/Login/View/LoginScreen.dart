import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Screen/Login/Provider/LoginScreenProvider.dart';
import 'package:login_page/Utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenProvider? loginScreenProviderTrue;
  LoginScreenProvider? loginScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    loginScreenProviderFalse =
        Provider.of<LoginScreenProvider>(context, listen: false);
    loginScreenProviderTrue =
        Provider.of<LoginScreenProvider>(context, listen: true);

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
                "Log In",
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
                  controller: loginScreenProviderFalse!.txtUserEmail,
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
              child: Text("Password"),
            ),
            Positioned(
              top: 460,
              left: 20,
              child: Container(
                width: 400,
                height: 50,
                child: TextField(
                  controller: loginScreenProviderFalse!.txtUserPassword,
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
              top: 520,
              left: 20,
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.libreFranklin(
                  color: Color(0xff491716),
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 170,
              child: InkWell(
                onTap: () async {
                  String UserEmail =
                      loginScreenProviderFalse!.txtUserEmail.text;
                  String UserPassword =
                      loginScreenProviderFalse!.txtUserPassword.text;

                  Shr shr = Shr();

                  Map m1 = await shr.readData();

                  print(
                      "${m1['g1']}======================================================${m1['p1']}===================${m1['l1']}");
                  print(
                      "${UserEmail}======================================================${UserPassword}");

                  if (m1['g1'] == UserEmail && m1['p1'] == UserPassword) {
                    shr.CreatData(UserEmail, UserPassword,true);
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Enter Valid UserName or Password",
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  child: Text(
                    "Log In",
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
              top: 630,
              left: 130,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'signup');
                },
                child: Text(
                  "Creat A New Account ? Sign Up",
                  style: GoogleFonts.libreFranklin(
                    color: Colors.black,
                    fontSize: 15,
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
