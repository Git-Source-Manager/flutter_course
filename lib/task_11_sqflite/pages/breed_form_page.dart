import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_11_sqflite/models/breed.dart';
import 'package:flutter_course/task_11_sqflite/services/database_service.dart';

class BreedFormPage extends StatefulWidget {
  const BreedFormPage({Key? key}) : super(key: key);

  @override
  BreedFormPageState createState() => BreedFormPageState();
}

class BreedFormPageState extends State<BreedFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Add a new breed", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter name of the breed here',),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descController,
              maxLines: 7,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter description about the breed here',),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: onSave,
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),),
                child: const Text('Save the Breed', style: TextStyle(fontSize: 16.0, color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSave() async {
    await databaseService.insertBreed(Breed(name: nameController.text, description: descController.text));
    Navigator.pop(context);
  }
}
