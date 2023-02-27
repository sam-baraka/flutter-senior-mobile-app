import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_amitruck/database_client/database_client.dart';
import 'package:interview_amitruck/providers/sql/savetosqlstate.dart';

final saveToSqlProvider =
    StateNotifierProvider<SaveToSqlProvider, SaveToSqlState>(
        (ref) => SaveToSqlProvider(SaveToSqlState.initial()));

class SaveToSqlProvider extends StateNotifier<SaveToSqlState> {
  SaveToSqlProvider(super.state);

  saveToSql({required Map<String, dynamic> data}) async {
    state = SaveToSqlState.loading();
    try {
      await DatabaseClient().saveToDb(data: data);
      state = SaveToSqlState.success();
    } catch (e) {
      state = SaveToSqlState.failed();
    }
  }
}
