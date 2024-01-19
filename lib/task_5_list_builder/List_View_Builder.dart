import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewBuilderTask extends StatefulWidget {
  const ListViewBuilderTask({super.key});

  @override
  State<ListViewBuilderTask> createState() => _ListViewBuilderTaskState();
}

class _ListViewBuilderTaskState extends State<ListViewBuilderTask> {

  List<int> members_id = [1, 2, 3, 4, 5];
  List<String> members_name = ["SAI KUMAR", "IMRAN", "VIKRAM", "RAM", "SURYA"];
  List<String> members_role = ["Trainer", "Student", "Student", "Student", "Student"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(ConstantString.str_task_5_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: ListView.builder(
        itemCount: members_id.length,
        itemBuilder: (context, index) {
          var id = members_id[index].toString();
          return Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.black, width: 0.2, ),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 35,
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Image.asset("assets/images/tab_layout_task_images/img_man_4.png", fit: BoxFit.fitHeight,),
                ),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(members_name[index], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text(members_role[index], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}