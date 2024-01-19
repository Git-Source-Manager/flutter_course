import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationTask extends StatefulWidget {
  const BottomNavigationTask({super.key});

  @override
  State<BottomNavigationTask> createState() => _BottomNavigationTaskState();
}

class _BottomNavigationTaskState extends State<BottomNavigationTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(ConstantString.str_task_10_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white,),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white,), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: SizedBox(height: 50, child: BottomNavigationBarTask(),),
      body: const Center(child: Text('Homepage!', style: TextStyle(fontFamily: 'Raleway', fontStyle: FontStyle.italic), )),
    );
  }
}

class BottomNavigationBarTask extends StatefulWidget {
  @override
  _BottomNavigationBarTaskState createState() => _BottomNavigationBarTaskState();
}

class _BottomNavigationBarTaskState extends State<BottomNavigationBarTask> {
  int selectedIndex = 0;

  List<NavigationItem> items = [
    NavigationItem(
      const Icon(Icons.home, color: Color.fromRGBO(91, 55, 183, 1),),
      const Text('Home', style: TextStyle(color: Color.fromRGBO(91, 55, 183, 1), fontWeight: FontWeight.bold),), const Color.fromRGBO(223, 215, 243, 1),
    ),
    NavigationItem(
        const Icon(Icons.favorite_border, color: Color.fromRGBO(201, 55, 157, 1)),
        const Text('Favorite', style: TextStyle(color: Color.fromRGBO(201, 55, 157, 1), fontWeight: FontWeight.bold),), const Color.fromRGBO(244, 211, 235, 1)
    ),
    NavigationItem(
        const Icon(Icons.search, color: Color.fromRGBO(230, 169, 25, 1),),
        const Text('Search', style: TextStyle(color: Color.fromRGBO(230, 169, 25, 1), fontWeight: FontWeight.bold),), const Color.fromRGBO(251, 239, 211, 1)
    ),
    NavigationItem(
        const Icon(Icons.person_outline, color: Color.fromRGBO(17, 148, 170, 1)),
        const Text('Profile', style: TextStyle(color: Color.fromRGBO(17, 148, 170, 1), fontWeight: FontWeight.bold),), const Color.fromRGBO(211, 235, 239, 1)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? const EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected ? BoxDecoration(color: item.color, borderRadius: const BorderRadius.all(Radius.circular(50))) : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(data: IconThemeData(size: 24, color: isSelected ? Colors.white : Colors.black,),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected ? DefaultTextStyle.merge(style: const TextStyle(color: Colors.white), child: item.title) : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;
  NavigationItem(this.icon, this.title, this.color);
}