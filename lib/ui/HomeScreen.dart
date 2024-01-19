import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/common/Constant_Strings.dart';
import 'package:flutter_course/task_3_grid_view/GridViewTask.dart';
import 'package:flutter_course/task_4_list_view/ListViewTask.dart';
import 'package:flutter_course/task_13_drop_down/DropDownTask.dart';
import 'package:flutter_course/task_16_routes/FirstScreenRoute.dart';
import 'package:flutter_course/task_7_tab_layout/TabLayoutTask.dart';
import 'package:flutter_course/task_11_sqflite/pages/home_page.dart';
import 'package:flutter_course/task_8_api/GET_CountryPickerTask.dart';
import 'package:flutter_course/task_12_http_rest_api/APIHomePage.dart';
import 'package:flutter_course/task_14_widgets_form/WidgetsFormTask.dart';
import 'package:flutter_course/task_15_bottom_sheet/BottomSheetTask.dart';
import 'package:flutter_course/task_5_list_builder/List_View_Builder.dart';
import 'package:flutter_course/task_2_login_register/ui/Splash_Screen.dart';
import 'package:flutter_course/task_1_appbar_row_column/row_column_task.dart';
import 'package:flutter_course/task_9_shared_preference/RegisterScreenTask.dart';
import 'package:flutter_course/task_6_navigation_drawer/NavigationDrawerTask.dart';
import 'package:flutter_course/task_10_bottom_navigation/BottomNavigationTask.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(ConstantString.str_app_name, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              //Task - 1 (AppBar, Row & Column)
              leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
              title: Text(ConstantString.str_task_1_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
              trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
              hoverColor: Colors.blue,
              onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const RowColumnTask()))),
            ListTile(
                //TASK - 2 (Login & Registration)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_2_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen()))),
            ListTile(
                //TASK - 3 (GridView)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_3_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewTask()))),
            ListTile(
                //TASK - 4 (ListView)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_4_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewTask()))),
            ListTile(
                //TASK - 5 (ListView Builder)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_5_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewBuilderTask()))),
            ListTile(
                //TASK - 6 (Navigation Drawer)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_6_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationDrawerTask()))),
            ListTile(
                //TASK - 7 (Tab Layout)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_7_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const TabLayoutTask()))),
            ListTile(
                //TASK - 8 (API Call - GET Method)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_8_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryPickerTask()))),
            ListTile(
                //TASK - 9 (Shared Preference)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_9_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreenTask()))),
            ListTile(
                //TASK - 10 (Bottom Navigation)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_10_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationTask()))),
            ListTile(
              //TASK - 11 (Sqflite)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_11_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()))),
            ListTile(
              //TASK - 12 (HTTP REST API)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_12_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const APIHomePage()))),
            ListTile(
              //TASK - 13 (Drop Down)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_13_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const DropDownTask()))),
            ListTile(
              //TASK - 14 (Widgets)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_14_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const WidgetsFormTask()))),
            ListTile(
              //TASK - 15 (Bottom Sheet)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_15_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomSheetTask()))),
            ListTile(
              //TASK - 16 (Routes & Image Slider)
                leading: const CircleAvatar(child: Icon(Icons.task_rounded),),
                title: Text(ConstantString.str_task_16_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                trailing: const Icon(size: 15, Icons.arrow_forward_ios_sharp),
                hoverColor: Colors.blue,
                onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstScreenRouteTask()))),
          ],
        ),
      )
    );
  }
}