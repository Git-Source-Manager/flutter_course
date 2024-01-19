import 'package:flutter/material.dart';

class DemoScene extends StatelessWidget {
  const DemoScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Center(child: Text("My Body"))),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        actions: [
          InkWell(
            hoverColor: Colors.orange,
            onTap: () {},
            child: const Center(
              child: Text(
                "Place",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(color: Colors.white, Icons.home))
        ],
        title: const Text("My Home"),
        leading: const Icon(color: Colors.white, Icons.icecream),
        centerTitle: false,
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
