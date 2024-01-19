import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_2_login_register/ui/SignIn_Screen.dart';
import 'package:flutter_course/task_2_login_register/constant/Constant_Colors.dart';
import 'package:flutter_course/task_2_login_register/constant/Constant_Strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInActivity())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/dribbble_images/img_dribbble_lite.png"))),
      child: Scaffold(
        backgroundColor: ConstantColor.clr_pink,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 100, "assets/images/dribbble_images/img_dribbble.png",),
              Text(ConstantString.str_dribbble, style: GoogleFonts.pacifico(fontWeight: FontWeight.normal, fontSize: 35, decoration: TextDecoration.none, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}