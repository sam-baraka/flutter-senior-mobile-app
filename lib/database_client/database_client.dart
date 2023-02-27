import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Future<Map<String, dynamic>> saveToDb(
      {required Map<String, dynamic> data}) async {
    var database = GetIt.I.get<Database>();
    await database.insert('amitruck_table', {'data': data.toString()});
    return data;
  }
}
