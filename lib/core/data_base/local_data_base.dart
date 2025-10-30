import 'package:moodly_j/core/failure/app_exception.dart';
import 'package:moodly_j/features/on_boarding_screen/data/models/user_model.dart';
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
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'userMoods.db');

    Database mydb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return mydb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Handle DB migrations if needed
  }

  Future<void> _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    // ---------- User Table ----------
    batch.execute('''
      CREATE TABLE user (
        name TEXT NOT NULL,
        language TEXT NOT NULL,
        imgPath TEXT NOT NULL
      );
    ''');

    // ---------- Mood Table ----------
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

  Future<void> clearAllData() async {
    final mydb = await db;
    await mydb!.delete('user');
    await mydb.delete('moods');
    print("✅ All local data cleared successfully");
  }
  //! ========================= USER SECTION =========================

  /// Create user (single-row table)
  Future<int> createUser({required UserModel userModel}) async {
    Database? mydb = await db;

    String sql = '''
      INSERT INTO user (
        name, language, imgPath
      ) VALUES (?,?,?)
    ''';

    int response = await mydb!.rawInsert(sql, [
      userModel.name,
      userModel.language,
      userModel.imgPath,
    ]);

    return response;
  }

  /// Update user fields (supports multiple or single field updates)
  Future<int> updateUser(Map<String, dynamic> fields) async {
    final mydb = await db;
    if (fields.isEmpty) return 0;
    final convertedFields = fields.map((k, v) {
      final value = v is DateTime ? v.toIso8601String() : v;
      return MapEntry(k, value);
    });
    final columns = convertedFields.keys.map((k) => '$k = ?').join(', ');
    final values = convertedFields.values.toList();
    String sql = 'UPDATE user SET $columns';
    return await mydb!.rawUpdate(sql, values);
  }

  /// Get the single user record
  Future<UserModel?> getUser() async {
    Database? mydb = await db;
    final rows = await mydb!.query('user', limit: 1);
    if (rows.isEmpty) return null;
    return UserModel.fromMap(rows.first);
  }

  //! ========================= MOODS SECTION =========================

  /// Insert a new mood
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

  /// Get all moods as list of maps
  Future<List<Map<String, dynamic>>> readData({
    required String tableName,
  }) async {
    Database? mydb = await db;
    String sql = "SELECT * FROM $tableName";
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    print(response);
    return response;
  }

  /// Delete mood by ID
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

  /// Get all moods as list of MoodModel
  Future<List<MoodModel>> getAllMoods() async {
    Database? mydb = await db;
    final rows = await mydb!.query('moods', orderBy: 'moodDate DESC');
    return rows.map((r) => MoodModel.fromMap(r)).toList();
  }
}
