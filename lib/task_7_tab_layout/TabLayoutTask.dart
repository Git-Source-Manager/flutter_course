import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class TabLayoutTask extends StatefulWidget {
  const TabLayoutTask({super.key});

  @override
  State<TabLayoutTask> createState() => _TabLayoutTaskState();
}

class _TabLayoutTaskState extends State<TabLayoutTask> {
  static const Color_Theme = Color(0xFF007c66);
  static const Color_Calls = Color(0xFF1fb8a2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color_Theme,
              title: Row(
                children: [
                  Text(ConstantString.str_task_7_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
                ],
              ),
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.5,
                tabs: [
                  Tab(child: Text("Chats", style: TextStyle(color: Colors.white),),),
                  Tab(child: Text("Updates", style: TextStyle(color: Colors.white),),),
                  Tab(child: Text("Calls", style: TextStyle(color: Colors.white),),),
                ],
              )
          ),
          body: TabBarView(children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(radius: 25, child: Image.asset(width: 35, "assets/images/tab_layout_task_images/img_man_1.png"),),
                    title: const Text("Sai Kumar", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("Hi, Bro"),
                    trailing: const Text("✓✓", style: TextStyle(color: Colors.blue),),
                    tileColor: Colors.brown.shade50,
                    onTap: (){},),
                  ListTile(
                    leading: CircleAvatar(radius: 25, child: Image.asset(width: 35, "assets/images/tab_layout_task_images/img_man_2.png"),),
                    title: const Text("Zafar", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("Hi, Zafar"),
                    trailing: const Text("✓✓", style: TextStyle(color: Colors.grey),),
                    tileColor: Colors.brown.shade50,
                    onTap: (){},),
                  ListTile(
                    leading: CircleAvatar(radius: 25, child: Image.asset(width: 35, "assets/images/tab_layout_task_images/img_man_3.png"),),
                    title: const Text("Siva",  style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: const Text("🎥 Video"),
                    trailing: const Text("✓✓", style: TextStyle(color: Colors.blue),),
                    tileColor: Colors.brown.shade50,
                    onTap: (){},),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 5, right: 10, left: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Status",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(radius: 25, child: Image.asset( "assets/images/tab_layout_task_images/img_man_4.png"),),
                          title: const Text("My status",  style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: const Text("Tap to add status update"),
                          tileColor: Colors.brown.shade50,
                          onTap: (){},
                        ),
                      ],
                    )
                  ],
                )
            ),
            Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(radius: 25, backgroundColor: Color_Calls, child: Icon(Icons.link, color: Colors.white70,),),
                      title: const Text("Create call link",  style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: const Text("Share a link for your WhatsApp call"),
                      tileColor: Color_Calls,
                      onTap: (){},
                    ),
                  ],
                )
            ),
          ]),
        ),
      ),
    );
  }
}