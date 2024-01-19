import '../models/dog.dart';
import 'dog_form_page.dart';
import '../models/breed.dart';
import 'breed_form_page.dart';
import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../../common/Constant_Strings.dart';
import '../common_widgets/dog_builder.dart';
import '../common_widgets/breed_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(ConstantString.str_task_11_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
          iconTheme: const IconThemeData(color: Colors.white,),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.5,
            tabs: [
              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(ConstantString.str_task_11_tab_1, style: const TextStyle(color: Colors.white),),),
              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(ConstantString.str_task_11_tab_2, style: const TextStyle(color: Colors.white),),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DogBuilder(
              future: _getDogs(),
              onEdit: (value) {
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => DogFormPage(dog: value), fullscreenDialog: true,),).then((_) => setState(() {}));
                }
              },
              onDelete: _onDogDelete,
            ),
            BreedBuilder(future: _getBreeds(),),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BreedFormPage(), fullscreenDialog: true,),).then((_) => setState(() {}));
              },
              heroTag: 'addBreed',
              child: const FaIcon(FontAwesomeIcons.plus, color: Colors.white),
            ),
            const SizedBox(height: 12.0),
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => DogFormPage(), fullscreenDialog: true,)).then((_) => setState(() {}));
              },
              heroTag: 'addDog',
              child: const FaIcon(FontAwesomeIcons.paw, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Breed>> _getBreeds() async {
    return await databaseService.breeds();
  }

  Future<List<Dog>> _getDogs() async {
    return await databaseService.dogs();
  }

  Future<void> _onDogDelete(Dog dog) async {
    await databaseService.deleteDog(dog.id!);
    setState(() {});
  }
}
