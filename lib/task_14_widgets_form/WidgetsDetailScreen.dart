import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsDetailScreen extends StatefulWidget {
  final String fname;
  final String lname;
  final String gender;
  final String program;
  final String mdate;
  final String mtime;

  WidgetsDetailScreen(this.fname,this.lname, this.gender, this.program,this.mdate,this.mtime,{super.key});

  @override
  State<WidgetsDetailScreen> createState() => _WidgetsDetailScreenState();
}

class _WidgetsDetailScreenState extends State<WidgetsDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text(ConstantString.str_task_14_sub_title_details, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${ConstantString.str_task_14_f_name}:-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.fname, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),

            _getPadding(),

            Text("${ConstantString.str_task_14_l_name}:-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.lname, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),

            _getPadding(),

            Text("${ConstantString.str_task_14_gender}:-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.gender, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),

            _getPadding(),

            Text("${ConstantString.str_task_14_dob}:-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.mdate, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),

            _getPadding(),

            Text("Created Time :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.mtime, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),

            _getPadding(),

            Text("Selected Programs :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.program, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.red),),
          ],
        ),
      ),
    );
  }

  _getPadding() {
    return const Padding(padding: EdgeInsets.all(10));
  }
}