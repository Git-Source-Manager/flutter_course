import 'package:flutter/material.dart';

class lifecycle_sample extends StatefulWidget {
  const lifecycle_sample({super.key});

  @override
  State<lifecycle_sample> createState() => _lifecycle_sampleState();
}

class _lifecycle_sampleState extends State<lifecycle_sample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState Called");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      body: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
          ),
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text(
            "Press Me $counter",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  @override
  void didUpdateWidget(covariant lifecycle_sample oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

/*
*** Lifecycle of a Stateful Widget ***
* createState
* initState
* didChangeDependencies
* build
* setState
* didUpdateWidget
* deactivate
* dispose
* reassemble
* For Reference :- https://medium.com/@hadiyaaamir222/lifecycle-of-a-stateful-widget-aece2d56c946#:~:text=A%20stateful%20widget%20in%20Flutter%20is%20a%20component%20that%20can,different%20stages%20of%20its%20existence.
* */
