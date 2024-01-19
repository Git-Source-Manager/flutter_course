import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_2_login_register/ui/SignIn_Screen.dart';
import 'package:flutter_course/task_2_login_register/constant/Constant_Colors.dart';
import 'package:flutter_course/task_2_login_register/constant/Constant_Strings.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({super.key});

  @override
  State<SignUpActivity> createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 100),
                  child: Opacity(
                    opacity: 0.8,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/dribbble_images/img_dribbble.png",
                          width: 65,
                        ),
                        Text(
                          ConstantString.str_dribbble,
                          style: GoogleFonts.pacifico(
                              fontWeight: FontWeight.normal,
                              fontSize: 30,
                              decoration: TextDecoration.none,
                              color: ConstantColor.clr_pink),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, top: 50),
                child: Column(
                  children: [
                    Text(
                      ConstantString.str_signup_head,
                      style: GoogleFonts.cabin(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: ConstantString.str_email,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: ConstantString.str_password,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          labelText: ConstantString.str_confirm_password,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 50.0,
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                ConstantColor.clr_pink),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ))),
                        child: Text(
                          ConstantString.str_signup,
                          style: GoogleFonts.cabin(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        ConstantString.str_signup_with,
                        style: GoogleFonts.encodeSansSemiCondensed(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.white,
                            margin: const EdgeInsets.only(top: 20, right: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                                "assets/images/dribbble_images/img_google.png",
                                width: 50,
                                fit: BoxFit.fitHeight),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.white,
                            margin: const EdgeInsets.only(top: 20, right: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                                "assets/images/dribbble_images/img_fb.png",
                                width: 50,
                                fit: BoxFit.fitHeight),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.white,
                            margin: const EdgeInsets.only(top: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                                "assets/images/dribbble_images/img_twitter.png",
                                width: 50,
                                fit: BoxFit.fitHeight),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantString.str_have_account,
                        style: GoogleFonts.encodeSansSemiCondensed(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignInActivity()));
                        },
                        child: Text(
                          ConstantString.str_signin,
                          style: GoogleFonts.encodeSansSemiCondensed(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              color: ConstantColor.clr_pink),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
