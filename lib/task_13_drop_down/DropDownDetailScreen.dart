import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownDetailScreen extends StatefulWidget {
  final String country;
  final String state;
  final String city;

  const DropDownDetailScreen(this.country,this.state,this.city,{super.key});

  @override
  State<DropDownDetailScreen> createState() => _DropDownDetailScreenState();
}

class _DropDownDetailScreenState extends State<DropDownDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text(ConstantString.str_task_13_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
          iconTheme: const IconThemeData(color: Colors.white,),),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ConstantString.str_task_13_country_name, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.country, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

            const SizedBox(height: 20,),

            Text(ConstantString.str_task_13_state_name, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.state, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

            const SizedBox(height: 20,),

            Text(ConstantString.str_task_13_city_name, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.none, color: Colors.black),),
            Text(widget.city, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),
          ],
        ),
      ),
    );
  }
}