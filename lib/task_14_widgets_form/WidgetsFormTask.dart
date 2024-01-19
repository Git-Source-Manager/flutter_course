import 'package:flutter_course/task_14_widgets_form/WidgetsDetailScreen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/ui/HomeScreen.dart';

class WidgetsFormTask extends StatefulWidget {
  const WidgetsFormTask({super.key});

  @override
  State<WidgetsFormTask> createState() => _WidgetsFormTaskState();
}

class _WidgetsFormTaskState extends State<WidgetsFormTask> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  List<String> options = ['Java', 'Kotlin', 'Flutter', 'Xamarin','React Native'];
  List<bool> selectedOptions = [false, false, false, false, false];
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int selectedGender = 0;

  String gender = "", program = "", mdate = "", mtime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text(ConstantString.str_task_14_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getTextFormField(context, "First Name", firstNameController),
                  _getPadding(),
                  _getTextFormField(context, "Last Name", lastNameController),
                ],
              ),

              _getPadding(),

              Text("Gender :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Male'),
                      leading: Radio(
                        value: 1,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                            gender = "Male";
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Female'),
                      leading: Radio(
                        value: 2,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                            gender = "Female";
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      title: const Text('Others'),
                      leading: Radio(
                        value: 3,
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                            gender = "Others";
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),

              _getPadding(),

              Text("Date of Birth :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('dd-MM-yyyy').format(selectedDate), style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                  _getPadding(),
                  IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_month))
                ],
              ),

              _getPadding(),

              Text("Created Time :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatTime(selectedTime), style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.black),),
                  _getPadding(),
                  IconButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      icon: const Icon(Icons.access_time_outlined))
                ],
              ),

              _getPadding(),

              Text("Select Your Programming Language :-", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),

              Container(
                padding: const EdgeInsets.only(right: 10, left: 10,),
                width: double.infinity,
                height: (MediaQuery.of(context).size.height) / 5,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red[100],
                ),
                child:  ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      dense: false,
                      contentPadding: EdgeInsets.zero,
                      title: Text(options[index]),
                      value: selectedOptions[index],
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            program = "$program${options[index]}, ";
                          }
                          selectedOptions[index] = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ),

              _getPadding(),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Confirmation"),
                        content:
                        const Text("Are you sure, Do you want to confirm the above details?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => {
                              Navigator.of(ctx).pop(),
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetsDetailScreen(firstNameController.text, lastNameController.text,
                                  gender, program, DateFormat('dd-MM-yyyy').format(selectedDate), _formatTime(selectedTime))))
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Ok"),
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Cancel"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(ConstantString.str_task_14_submit, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 18, decoration: TextDecoration.none, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final DateTime dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm a').format(dateTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}

_getPadding() {
  return const Padding(padding: EdgeInsets.all(10));
}

_getTextFormField(BuildContext context, String hint, TextEditingController textEditingController) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width) / 2.5,
    child: TextField(
      controller: textEditingController,
      keyboardType: TextInputType.text, maxLength: 30,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: hint,
        filled: true,
        fillColor: Colors.red.shade100,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}