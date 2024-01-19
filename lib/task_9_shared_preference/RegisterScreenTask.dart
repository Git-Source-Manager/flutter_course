import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/common/Constant_Strings.dart';
import 'package:flutter_course/task_9_shared_preference/HomeScreenTask.dart';
import 'package:flutter_course/task_9_shared_preference/CommonSharedPreference.dart';

class RegisterScreenTask extends StatefulWidget {
  const RegisterScreenTask({super.key});

  @override
  State<RegisterScreenTask> createState() => _RegisterScreenTaskState();
}

class _RegisterScreenTaskState extends State<RegisterScreenTask> {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text(ConstantString.str_task_9_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/shared_pref_task_images/img_login.png")),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text("Name", style: TextStyle(fontSize: 15),),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextField(
                controller: name,
                keyboardType: TextInputType.text, maxLength: 25,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Name",
                  filled: true,
                  fillColor: Colors.red.shade100,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text("Age", style: TextStyle(fontSize: 15),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextField(
                controller: age,
                keyboardType: TextInputType.number, maxLength: 2,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Age",
                  filled: true,
                  fillColor: Colors.red.shade100,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text("Mobile No.", style: TextStyle(fontSize: 15),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextField(
                controller: mobile,
                keyboardType: TextInputType.number, maxLength: 10,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Mobile No.",
                  filled: true,
                  fillColor: Colors.red.shade100,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text("Password", style: TextStyle(fontSize: 15),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.red.shade100,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //prefixIcon: Icon(Icons.lock_rounded, size: 24),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3)),))),
              child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),),
              onPressed: () async {
                if (name.text.isEmpty) {
                  showToast("Enter Name");
                } else if (age.text.isEmpty) {
                  showToast("Enter Age");
                } else if (mobile.text.isEmpty) {
                  showToast("Enter Mobile");
                } else if (password.text.isEmpty) {
                  showToast("Enter Password");
                } else {
                  CommonSharedPreference.putRegister(name.text, 27, 9698792588, password.text, true);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenTask()));
                }
              },
            ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = true;
    });
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