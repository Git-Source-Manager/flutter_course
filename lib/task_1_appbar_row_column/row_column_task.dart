import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowColumnTask extends StatefulWidget {
  const RowColumnTask({super.key});

  @override
  State<RowColumnTask> createState() => _RowColumnTaskState();
}

class _RowColumnTaskState extends State<RowColumnTask> {
  static const Color bodyColor = Color(0xFFECECEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
          title: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, imran!👋",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Well done today! Keep it up!",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 175.0,
                // color: Colors.orange,
                decoration: BoxDecoration(color: Colors.red),
                // decoration: BoxDecoration(
                //  // color: Colors.green,
                //  // shape: BoxShape.rectangle,
                //  // border: Border.all(color: Colors.black),
                //  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                // ),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(),
                  margin: EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Calories Remaining",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "8.232",
                              style: TextStyle(
                                  fontSize: 30,
                                  height: double.minPositive,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "KCAL LEFT",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Goals 1,500",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Activity",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "+ Add New",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10, left: 20, right: 5),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gym",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                      color: Colors.black54,
                                      Icons.more_horiz_rounded),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "120",
                                    style: TextStyle(
                                        fontSize: 30,
                                        height: double.minPositive,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  //Spacer(),
                                  Text(
                                    "MINUTE",
                                    style: GoogleFonts.pacifico(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175,
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10, right: 15, left: 5),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Water",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                      color: Colors.black54,
                                      Icons.more_horiz_rounded),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 30,
                                        height: double.minPositive,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "GLASS",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10, left: 20, right: 5),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175,
                      height: 100,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10, right: 15, left: 5),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Recent Activity",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View More",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}