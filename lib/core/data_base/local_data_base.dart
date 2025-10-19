import 'package:moodly_j/core/failure/app_exception.dart';
import 'package:moodly_j/core/models/user_model.dart';
import 'package:moodly_j/features/moods/data/models/mood_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _dataBase;

  Future<Database?> get db async {
    if (_dataBase == null) {
      _dataBase = await initialDb();
      return _dataBase;
    } else {
      return _dataBase;
    }
  }

  Future<Database> initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'userMoods.db');
    Database mydb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // handle migrations here
  }

  Future<void> _onCreate(Database db, int version) async {
    // نفذ كل CREATE statement لوحده أو استخدم batch
    Batch batch = db.batch();

    batch.execute('''
      CREATE TABLE users (
        name TEXT NOT NULL,
        language TEXT NOT NULL DEFAULT 'en',
        theme TEXT NOT NULL DEFAULT 'light',
        notificationTime TEXT NOT NULL DEFAULT '20:00',
        todayMood TEXT,
        totalMoods INTEGER NOT NULL DEFAULT 0,
        writingStreak INTEGER NOT NULL DEFAULT 0,
        mostFrequent TEXT
      );
    ''');

    batch.execute('''
      CREATE TABLE moods (
        moodID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        description TEXT NOT NULL,
        emoji TEXT NOT NULL,
        imgPath TEXT,
        audioPath TEXT,
        moodDate TEXT NOT NULL
      );
    ''');

    await batch.commit(noResult: true);
  }

  // ---------- Insert Mood ----------
  Future<int> addMood({required MoodModel moodModel}) async {
    Database? mydb = await db;
    final moodDateStr = moodModel.moodDate.toIso8601String();

    String sql = '''
      INSERT INTO moods (description, emoji, imgPath, audioPath, moodDate)
      VALUES (?, ?, ?, ?, ?)
    ''';

    int response = await mydb!.rawInsert(sql, [
      moodModel.description,
      moodModel.emoji,
      moodModel.imgPath,
      moodModel.audioPath,
      moodDateStr,
    ]);
    return response;
  }

  // ---------- Create User (assume single row user) ----------
  Future<int> createUser({required UserModel userModel}) async {
    Database? mydb = await db;

    String sql = '''
      INSERT INTO users (
        name, language, theme, notificationTime, todayMood, totalMoods, writingStreak, mostFrequent
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''';

    int response = await mydb!.rawInsert(sql, [
      userModel.name,
      userModel.language,
      userModel.theme,
      userModel.notificationTime?.toIso8601String() ?? '20:00',
      userModel.todayMood,
      userModel.totalMoods ?? 0,
      userModel.writingStreak ?? 0,
      userModel.mostFrequent,
    ]);

    return response;
  }

  // ---------- Read Generic ----------
  Future<List<Map<String, dynamic>>> readData({
    required String tableName,
  }) async {
    Database? mydb = await db;
    String sql = "SELECT * FROM $tableName";
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    print(response);
    return response;
  }

  // ---------- Update User (single-row user) ----------
  Future<int> updateUser({
    required String columnName,
    required dynamic value,
  }) async {
    Database? mydb = await db;

    // convert DateTime if needed
    final paramValue = value is DateTime ? value.toIso8601String() : value;

    String sql = "UPDATE users SET $columnName = ?";
    int response = await mydb!.rawUpdate(sql, [paramValue]);
    return response;
  }

  // ---------- Delete Mood ----------
  Future<int> deleteMood({required int id}) async {
    try {
      Database? mydb = await db;
      String sql = "DELETE FROM moods WHERE moodID = ?";
      int response = await mydb!.rawDelete(sql, [id]);

      return response;
    } catch (e) {
      print(e.toString());
      throw AppException(e.toString());
    }
  }

  // ---------- Helpers: get all moods as MoodModel ----------
  Future<List<MoodModel>> getAllMoods() async {
    Database? mydb = await db;
    final rows = await mydb!.query('moods', orderBy: 'moodDate DESC');
    return rows.map((r) => MoodModel.fromMap(r)).toList();
  }

  // ---------- Helper: getUser (single row) ----------
  Future<UserModel?> getUser() async {
    Database? mydb = await db;
    final rows = await mydb!.query('users', limit: 1);
    if (rows.isEmpty) return null;
    return UserModel.fromMap(rows.first);
  }
}
