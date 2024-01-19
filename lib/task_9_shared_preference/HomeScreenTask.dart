import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_9_shared_preference/CommonSharedPreference.dart';

class HomeScreenTask extends StatefulWidget {
  const HomeScreenTask({super.key});

  @override
  State<HomeScreenTask> createState() => _HomeScreenTaskState();
}

class _HomeScreenTaskState extends State<HomeScreenTask> {
  String name = "";
  @override
  void initState() {
    super.initState();
    name = CommonSharedPreference.getRegisterName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            ConstantString.str_task_9_sub_title,
            style: GoogleFonts.acme(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: Column(
        children: [
          Text(name, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
          /*Text(CommonSharedPreference.getRegisterAge(), style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
          Text(CommonSharedPreference.getRegisterMobile(), style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
          Text(CommonSharedPreference.getRegisterPassword(), style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),*/
        ],
      ),
    );
  }
}
