import 'dart:convert';
import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryPickerTask extends StatefulWidget {
  const CountryPickerTask({super.key});

  @override
  State<CountryPickerTask> createState() => _CountryPickerTaskState();
}

class _CountryPickerTaskState extends State<CountryPickerTask> {
  List<dynamic> countries = [];

  @override
  void initState() {
    super.initState();
    fetchCountryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(ConstantString.str_task_8_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => {
                fetchCountryList(),
              },
              child: Container(
                width: 35,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Icon(Icons.refresh, color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 35,
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    child: Image.asset(country['ImagePath'], fit: BoxFit.fitHeight,),
                  ),
                  const SizedBox(width: 10,),
                  Text(country['NameUpperCase'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void fetchCountryList() async {
    const url = 'https://studiocamp.in/api/GetCountryList';
    final uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          countries = json;
        });
        showToast("Success");
      } else {
        showToast("Failed");
      }
    } catch (error) {
      showToast("Error: $error");
    }
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

  Future showAlert() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.zero),),
            child: SizedBox(
              width: 200.0,
              height: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    color: Colors.blue,
                    child: Text(ConstantString.str_app_name,
                      style: GoogleFonts.acme(fontWeight: FontWeight.normal,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.white),),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future showProgress() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.zero),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black87,
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(
                                strokeWidth: 3
                            )
                        )
                    ),
                    Text("please wait. Loading...", style: TextStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center,),
                  ]),
            ),
          );
        });
  }
}