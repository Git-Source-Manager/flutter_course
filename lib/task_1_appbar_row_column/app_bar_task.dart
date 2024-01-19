import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class myAppBarTask extends StatelessWidget {
  const myAppBarTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          color: Colors.white,
          size: 30.0,
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                showToast("Bell Button Pressed");
              }),
          SizedBox(
              width: 70,
              height: 70,
              child: InkWell(
                hoverColor: Colors.deepOrange,
                onTap: () {
                  showToast("Back Button Pressed");
                },
                child: const Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 22.0),
                  ),
                ),
              ))
        ],
      ),
      body: const Center(
        child: Text(
          "*** Dashboard ***",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
        ),
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