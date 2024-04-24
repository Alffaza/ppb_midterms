import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:midterms/model/movie.dart';

class MoviesDatabase {
  static final MoviesDatabase instance = MoviesDatabase._init();

  static Database? _database;

  MoviesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate:  _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute(
        '''
CREATE TABLE $tableMovies (
  ${MovieFields.id} $idType,
  ${MovieFields.title} $textType,
  ${MovieFields.posterUrl} $textType,
  ${MovieFields.director} $textType,
  ${MovieFields.description} $textType,
  ${MovieFields.releaseTime} $textType,
  ${MovieFields.endTime} $textType
)
'''
    );
  }

  Future<Movie> create(Movie movie) async {
    final db = await instance.database;
    final id = await db.insert(tableMovies, movie.toJson());

    return movie.copy(id: id);
  }

  Future<Movie> readMovie(int id) async {
    final db = await instance.database;

    final maps = await db.query(
        tableMovies,
        columns: MovieFields.values,
        where: '${MovieFields.id} = ?',
        whereArgs: [id]
    );

    if(maps.isNotEmpty){
      return Movie.fromJson(maps.first);
    } else {
      throw Exception('Movie with ID $id cannot be found');
    }
  }

  Future<List<Movie>> readAllMovies() async {
    final db = await instance.database;
    const orderBy = '${MovieFields.releaseTime} ASC';
    final result = await db.query(tableMovies, orderBy: orderBy);
    print('test');
    return result.map((json) => Movie.fromJson(json)).toList();
  }

  Future<int> update(Movie note) async {
    final db = await instance.database;
    return db.update(
        tableMovies,
        note.toJson(),
        where: '${MovieFields.id} = ?',
        whereArgs: [note.id]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
        tableMovies,
        where: '${MovieFields.id} = ?',
        whereArgs: [id]
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}