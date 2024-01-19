import '../models/dog.dart';
import '../models/breed.dart';
import 'package:flutter/material.dart';
import '../common_widgets/age_slider.dart';
import '../services/database_service.dart';
import '../common_widgets/color_picker.dart';
import '../common_widgets/breed_selector.dart';
import 'package:google_fonts/google_fonts.dart';

class DogFormPage extends StatefulWidget {
  const DogFormPage({Key? key, this.dog}) : super(key: key);
  final Dog? dog;

  @override
  DogFormPageState createState() => DogFormPageState();
}

class DogFormPageState extends State<DogFormPage> {
  int selectedAge = 0;
  int selectedColor = 0;
  int selectedBreed = 0;
  static final List<Breed> _breeds = [];
  final DatabaseService databaseService = DatabaseService();
  final TextEditingController nameController = TextEditingController();
  static final List<Color> colors = [
    const Color(0xFF000000),
    const Color(0xFFFFFFFF),
    const Color(0xFF947867),
    const Color(0xFFC89234),
    const Color(0xFF862F07),
    const Color(0xFF2F1B15),
    const Color(0xFFDC3E7C),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.dog != null) {
      nameController.text = widget.dog!.name;
      selectedAge = widget.dog!.age;
      selectedColor = colors.indexOf(widget.dog!.color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("New Dog Record", style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the dog here',
              ),
            ),
            const SizedBox(height: 16.0),
            // Age Slider
            AgeSlider(
              max: 30.0,
              selectedAge: selectedAge.toDouble(),
              onChanged: (value) {
                setState(() {
                  selectedAge = value.toInt();
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Color Picker
            ColorPicker(
              colors: colors,
              selectedIndex: selectedColor,
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              },
            ),
            const SizedBox(height: 24.0),
            // Breed Selector
            FutureBuilder<List<Breed>>(
              future: getBreeds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading breeds...");
                }
                return BreedSelector(
                  breeds: _breeds.map((e) => e.name).toList(),
                  selectedIndex: selectedBreed,
                  onChanged: (value) {
                    setState(() {
                      selectedBreed = value;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: onSave,
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),),
                child: const Text('Save the Dog Details', style: TextStyle(fontSize: 16.0, color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Breed>> getBreeds() async {
    final breeds = await databaseService.breeds();
    if (_breeds.length == 0) _breeds.addAll(breeds);
    if (widget.dog != null) {
      selectedBreed = _breeds.indexWhere((e) => e.id == widget.dog!.breedId);
    }
    return _breeds;
  }

  Future<void> onSave() async {
    final age = selectedAge;
    final name = nameController.text;
    final color = colors[selectedColor];
    final breed = _breeds[selectedBreed];

    widget.dog == null ? await databaseService.insertDog(Dog(name: name, age: age, color: color, breedId: breed.id!),) : await databaseService.updateDog(Dog(id: widget.dog!.id, name: name, age: age, color: color, breedId: breed.id!,),);
    Navigator.pop(context);
  }
}
