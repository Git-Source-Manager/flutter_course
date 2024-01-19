import 'package:flutter/material.dart';

class RowColumnSample extends StatefulWidget {
  const RowColumnSample({super.key});

  @override
  State<RowColumnSample> createState() => _RowColumnSampleState();
}

class _RowColumnSampleState extends State<RowColumnSample> {
  @override
  Widget build(BuildContext context) {
    var texttype = TextStyle(color: Colors.limeAccent, fontSize: 25);
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                color: Colors.deepOrangeAccent,
                child: Text("Text value of  - 1")),
            Container(color: Colors.green, child: Text("Text - 2")),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Column Example",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
