import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerTask extends StatefulWidget {
  const NavigationDrawerTask({super.key});

  @override
  State<NavigationDrawerTask> createState() => _NavigationDrawerTaskState();
}

class _NavigationDrawerTaskState extends State<NavigationDrawerTask> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(ConstantString.str_task_6_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("a.si****n@gmail.com"),
              accountEmail: Text("Sirajudeen Imran A"),
              currentAccountPicture: CircleAvatar(foregroundImage: AssetImage("assets/images/nav_drawer_images/man.png"),),
              otherAccountsPictures: [
                CircleAvatar(
                  foregroundImage: AssetImage("assets/images/nav_drawer_images/logout.png"),
                  backgroundColor: Colors.transparent,),
              ],
              decoration: BoxDecoration(color: Colors.blue,),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => showToast("Home Clicked"),),
            ListTile(
              leading: const Icon(Icons.shopping_cart_rounded),
              title: const Text("Shop"),
              onTap: () => showToast("Shop Clicked"),),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorites"),
              onTap: () => showToast("Favorites Clicked"),),
            const Padding(padding: EdgeInsets.all(14.0), child: Text("Labels"),),
            ListTile(
              leading: const Icon(Icons.label, color: Colors.red,),
              title: const Text("Red"),
              onTap: () => showToast("Red Clicked"),),
            ListTile(
              leading: const Icon(Icons.label, color: Colors.orange,),
              title: const Text("Orange"),
              onTap: () => showToast("Orange Clicked"),),
            ListTile(
              leading: const Icon(Icons.label, color: Colors.green,),
              title: const Text("Green"),
              onTap: () => showToast("Green Clicked"),),
          ],
        ),
      ),
      body: ListView(
        //itemExtent: 100.0,
        reverse: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.home),),
            title: const Text("Home"),
            subtitle: const Text("Welcome Imran"),
            trailing: const Text("Logout"),
            tileColor: Colors.brown.shade50,
            onTap: () => showToast("Home Clicked"),),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.account_circle),),
            title: const Text("Contacts"),
            subtitle: const Text("+91-9698792588"),
            trailing: const Icon(Icons.call),
            tileColor: Colors.orange.shade50,
            onTap: () => showToast("Contacts Clicked"),),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.settings),),
            title: const Text("Settings"),
            subtitle: const Text("a.si****@gmail.com"),
            trailing: const Icon(Icons.arrow_forward_ios),
            tileColor: Colors.yellow.shade50,
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