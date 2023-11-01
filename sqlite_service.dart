import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/saham.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE saham("
                "tickerid INTEGER PRIMARY KEY AUTOINCREMENT, "
                "ticker TEXT NOT NULL, "
                "open INTEGER, "
                "high INTEGER, "
                "last INTEGER, "
                "change TEXT)"
        );
      },
      version: 1,
    );
  }

  Future<int> insertSaham(List<Saham> sahamList) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var saham in sahamList) {
      result = await db.insert('saham', saham.toMap());
    }
    return result;
  }

  Future<List<Saham>> retrieveSaham() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('saham');
    return queryResult.map((e) => Saham.fromMap(e)).toList();
  }
}