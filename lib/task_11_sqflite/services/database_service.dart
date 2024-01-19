import '../models/dog.dart';
import '../models/breed.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class DatabaseService {
  static final DatabaseService databaseService = DatabaseService.internal();
  factory DatabaseService() => databaseService;
  DatabaseService.internal();
  static Database? db;

  Future<Database> get database async {
    if (db != null) return db!;
    db = await initDatabase();
    return db!;
  }

  //Database Creation  :-
  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'animals.db');
    return await openDatabase(path, onCreate: onCreate, version: 1, onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),);
  }

  //OnCreate(), To create a table if it not exists :-
  Future<void> onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE breeds (id INTEGER PRIMARY KEY, name TEXT, description TEXT)',);
    await db.execute('CREATE TABLE dogs (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES breeds(id) ON DELETE SET NULL)',);
  }

  //To Create :-
  Future<void> insertBreed(Breed breed) async {
    final db = await databaseService.database;
    //Insert the Breed into the correct table. You might also specify the `conflictAlgorithm` to use in case the same breed is inserted twice. In this case, replace any previous data.
    await db.insert('breeds', breed.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<void> insertDog(Dog dog) async {
    final db = await databaseService.database;
    await db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  //To Read :-
  Future<List<Breed>> breeds() async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('breeds');
    return List.generate(maps.length, (index) => Breed.fromMap(maps[index]));
  }

  Future<Breed> breed(int id) async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('breeds', where: 'id = ?', whereArgs: [id]);
    return Breed.fromMap(maps[0]);
  }

  Future<List<Dog>> dogs() async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (index) => Dog.fromMap(maps[index]));
  }

  //To Update :-
  Future<void> updateBreed(Breed breed) async {
    final db = await databaseService.database;
    await db.update('breeds', breed.toMap(), where: 'id = ?', whereArgs: [breed.id],);
  }

  Future<void> updateDog(Dog dog) async {
    final db = await databaseService.database;
    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  //To Delete :-
  Future<void> deleteBreed(int id) async {
    final db = await databaseService.database;
    await db.delete('breeds', where: 'id = ?', whereArgs: [id],);
  }

  Future<void> deleteDog(int id) async {
    final db = await databaseService.database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}