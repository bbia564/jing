
import 'package:get/get.dart';
import 'package:menstrual_record/db_menstrual/menstrual_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBMenstrual extends GetxService {
  late Database dbBase;

  Future<DBMenstrual> init() async {
    await createMenstrualDB();
    return this;
  }

  createMenstrualDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'menstrual.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createMenstrualTable(db);
        });
  }

  createMenstrualTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS menstrual (id INTEGER PRIMARY KEY, createdTime TEXT, content TEXT)');
  }

  insertMenstrual(MenstrualEntity entity) async {
    final id = await dbBase.insert('menstrual', {
      'createdTime': entity.createdTime.toIso8601String(),
      'content': entity.content,
    });
    return id;
  }

  cleanMenstrualData() async {
    await dbBase.delete('menstrual');
  }

  Future<List<MenstrualEntity>> getMenstrualAllData() async {
    var result = await dbBase.query('menstrual', orderBy: 'createdTime ASC');
    return result.map((e) => MenstrualEntity.fromJson(e)).toList();
  }
}
