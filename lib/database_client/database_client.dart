import 'dart:convert';
import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Future<Map<String, dynamic>> saveToDb(
      {required Map<String, dynamic> data}) async {
    try {
      var database = GetIt.I.get<Database>();
      await database.insert('amitruck_table', {'data': jsonEncode(data)});
      return data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getRows() async {
    try {
      var database = GetIt.I.get<Database>();
      var rows = await database.query('amitruck_table');
      // return the rows as a list of maps
      print(rows[0]['data'].toString());
      return rows;
    } catch (e) {
      throw e;
    }
  }
}
