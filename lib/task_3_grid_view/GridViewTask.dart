import 'package:flutter/material.dart';

class GridViewTask extends StatefulWidget {
  const GridViewTask({super.key});

  @override
  State<GridViewTask> createState() => _GridViewTaskState();
}

class _GridViewTaskState extends State<GridViewTask> {
  List<String> images = [
    'assets/images/grid_task_images/one.jpg',
    'assets/images/grid_task_images/two.jpg',
    'assets/images/grid_task_images/three.jpg',
    'assets/images/grid_task_images/four.jpg',
    'assets/images/grid_task_images/five.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Center(
            child: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 35,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "0",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/grid_task_images/one.jpg"),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                        ],
                        begin: Alignment.bottomRight,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Lifestyle Sale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: images
                      .map((e) => Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(e),
                                        fit: BoxFit.cover)),
                                child: Transform.translate(
                                  offset: const Offset(50, -50),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 60),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(Icons.bookmark_border),
                                  ),
                                )),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}