import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../Package/Constants.dart';

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        """CREATE TABLE article(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, author TEXT, urlToImage TEXT, content TEXT,publishedAt TEXT) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('articles.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<void> createItem(
      String title,
      String description,
      String author,
      String urlToImage,
      String content,
      String publishedAt) async {
    final db = await SQLHelper.db();
    final isPresent;
    isPresent = await db.query(
      'article',
      where: 'title = ? AND content = ?',
      whereArgs: [title, content],
      limit: 1,
    );
    if (isPresent.isNotEmpty) {
      toast('Article already added to Offline Reads!');
    } else {
      // print('**************${isPresent.isNotEmpty}');

      final data = {
        'title': title,
        'description': description,
        "author": author,
        "urlToImage": urlToImage,
        "content": content,
        "publishedAt": publishedAt
      };
      await db
          .insert('article', data,
              conflictAlgorithm: sql.ConflictAlgorithm.replace)
          .then((value) => toast('Article added to Offline Reads.'));
    }

    // return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('article', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('article', where: "id = ?", whereArgs: [id], limit: 1);
  }

  Future<bool> isItemPresent(String title, String content) async {
    final db = await SQLHelper.db();
    final result = await db.query(
      'article',
      where: 'title = ? AND content = ?',
      whereArgs: [title, content],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  static Future<bool> deleteItem(String title, String content) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("article",
          where: "title = ? AND content = ?", whereArgs: [title, content]);
      return true;
    } catch (err) {
      debugPrint("Something went wrong when deleting an item : $err");
      return false;
    }
  }
}
