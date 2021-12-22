import 'package:flutter/foundation.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //static final homeController = Get.put(HomeController());
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE notifications(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        body TEXT,
        messageId VARCHAR(255) NOT NULL UNIQUE,
        isRead bool NOT NULL DEFAULT FALSE,
        receivedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        readAt TIMESTAMP
      )
      """);
  }
// id: the id of a notification
// title, body: name and body of your activity
// created_at: the time that the notification was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'gcms.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new notification (journal)
  static Future<int> createNotification(
      {required String title,
      required String body,
      required String messageId}) async {
    HomeController().isProcessing.value = true;
    final db = await SQLHelper.db();

    final data = {'title': title, 'body': body, 'messageId': messageId};
    final id = await db.insert('notifications', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    HomeController().isProcessing.value = false;
    print("CREATED NOTIFICATION ID ---> $id");
    return id;
  }

  // Read all notifications (journals)
  static Future<List<Map<String, dynamic>>> getNotifications() async {
    print("SQL HELPER GET NOTIFICATIONS CALLED.");
    HomeController().isProcessing.value = true;
    print("-----> ${HomeController().isProcessing.value}");
    final db = await SQLHelper.db();
    var notificationz = db.query('notifications', orderBy: "id");
    HomeController().isProcessing.value = false;
    print("-----> ${HomeController().isProcessing.value}");
    return notificationz;
  }

  // Read a single notification by messageId
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getNotification(
      {required String messageId}) async {
    HomeController().isProcessing.value = true;
    final db = await SQLHelper.db();
    var notfcn = db.query('notifications',
        where: "messageId = ?", whereArgs: [messageId], limit: 1);
    HomeController().isProcessing.value = false;
    return notfcn;
  }

  // Update a notification by messageId
  static Future<int> updateNotification(String messageId) async {
    HomeController().isProcessing.value = true;
    final db = await SQLHelper.db();

    final data = {'isRead': true, 'readAt': DateTime.now().toString()};

    final result = await db.update('notifications', data,
        where: "messageId = ?", whereArgs: [messageId]);
    HomeController().isProcessing.value = false;
    return result;
  }

  // Delete
  static Future<void> deleteNotification({required String messageId}) async {
    HomeController().isProcessing.value = true;
    final db = await SQLHelper.db();
    try {
      await db.delete("notifications",
          where: "messageId = ?", whereArgs: [messageId]);
      HomeController().isProcessing.value = false;
    } catch (err) {
      debugPrint("Something went wrong when deleting an notification: $err");
      HomeController().isProcessing.value = false;
    }
  }
}
