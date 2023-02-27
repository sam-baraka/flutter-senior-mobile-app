import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_amitruck/database_client/database_client.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {
  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    return Future(() => 1);
  }
}

void main() async {
  /// Register the database as a singleton
  GetIt.I.registerSingleton<Database>(MockDatabase());
  group('DatabaseClient tests', () {
    final DatabaseClient databaseClient = DatabaseClient();

    test('The database clent saves to the db successfully', () async {
      final data = {'key1': 'value1', 'key2': 2};

      await databaseClient.saveToDb(data: data);

      // Now, you can add your assertions to check if the data was saved to the database correctly
      // For example, you can open the database connection again and read the saved data from the database
      final db = await databaseClient.saveToDb(data: data);
      expect(data, db);
    });
  });
}
