import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/common/Constant_Strings.dart';

class SecondScreenRouteTask extends StatefulWidget {
  const SecondScreenRouteTask({super.key});

  @override
  State<SecondScreenRouteTask> createState() => _SecondScreenRouteTaskState();
}

class _SecondScreenRouteTaskState extends State<SecondScreenRouteTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text(ConstantString.str_task_16_second, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,),
              child: Text("◀ First Screen", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.white),),
              onPressed: () => {
                Navigator.pushNamed(context, '/'),
              }
          ),
        ],
      ),
    );
  }
}