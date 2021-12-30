import 'package:gcms/app/modules/Notifications/models/notification_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotificationsDatabase {
  static final NotificationsDatabase instance = NotificationsDatabase._init();

  static Database? _database;

  NotificationsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('gcms_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    //final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotifications (
  ${NotificationFields.id} $idType,
  ${NotificationFields.isRead} $boolType,
  ${NotificationFields.messageId} $textType,
  ${NotificationFields.title} $textType,
  ${NotificationFields.body} $textType,
  ${NotificationFields.createdTime} $textType
  )
''');
  }

  Future<FCMNotification> create(FCMNotification notification) async {
    print("CREATE NOTIFICATION IN NOTIFICATIONS DB FILE CALLED");
    final db = await instance.database;

    // final json = notification.toJson();
    // final columns =
    //     '${NotificationFields.title}, ${NotificationFields.description}, ${NotificationFields.time}';
    // final values =
    //     '${json[NotificationFields.title]}, ${json[NotificationFields.description]}, ${json[NotificationFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotifications, notification.toJson());
    print("INSERTED NOTIFICATION INTO DB AND RETURNED ID: $id");
    return notification.copy(id: id);
  }

  Future<FCMNotification?> getNotification(int id) async {
    // homeController.isProcessing.value = true;
    final db = await instance.database;

    final maps = await db.query(
      tableNotifications,
      columns: NotificationFields.values,
      where: '${NotificationFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FCMNotification.fromJson(maps.first);
    } else {
      print('ID $id not found');
      return null;
    }
  }

  Future<List<FCMNotification>> getAllNotifications() async {
    print("GET ALL NOTIFICATIONS CALLED IN DB FILE");
    final db = await instance.database;

    final orderBy = '${NotificationFields.createdTime} DESC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotifications ORDER BY $orderBy');

    final result = await db.query(tableNotifications, orderBy: orderBy);

    return result.map((json) => FCMNotification.fromJson(json)).toList();
  }

  Future<int> update(FCMNotification notification) async {
    print("UPDATE NOTIFICATION CALLED IN DB FILE");
    final db = await instance.database;

    return db.update(
      tableNotifications,
      notification.toJson(),
      where: '${NotificationFields.id} = ?',
      whereArgs: [notification.id],
    );
  }

  Future<int> updateNotification(String messageId) async {
    final db = await instance.database;
    final data = {'isRead': true};
    return db.update(
      tableNotifications,
      data,
      where: '${NotificationFields.messageId} = ?',
      whereArgs: [messageId],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotifications,
      where: '${NotificationFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
