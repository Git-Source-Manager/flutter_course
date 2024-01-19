import 'dart:async';
import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/ui/HomeScreen.dart';
import 'package:flutter_course/task_16_routes/FirstScreenRoute.dart';
import 'package:flutter_course/task_16_routes/SecondScreenRoute.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainSplashScreen(),
      /*initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreenRouteTask(),
        '/second': (context) => const SecondScreenRouteTask(),
      },*/
    );
  }
}

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreenView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 300,
              "assets/images/img_logo.png",
            ),
            Text(
              ConstantString.str_app_name,
              style: GoogleFonts.acme(
                  fontWeight: FontWeight.normal,
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}