import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({super.key});

  @override
  State<ListViewTask> createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(ConstantString.str_task_4_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        itemExtent: 75.0,
        reverse: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.home),),
            title: const Text("Home"),
            subtitle: const Text("Welcome Imran"),
            trailing: const Text("Logout"),
            onTap: () => showToast("Home Clicked"),),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.account_circle),),
            title: const Text("Contacts"),
            subtitle: const Text("+91-9698792588"),
            trailing: const Icon(Icons.call),
            onTap: () => showToast("Contacts Clicked"),),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.settings),),
            title: const Text("Settings"),
            subtitle: const Text("a.si****@gmail.com"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () => showToast("Settings Clicked"),),
        ],
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.indigo,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
