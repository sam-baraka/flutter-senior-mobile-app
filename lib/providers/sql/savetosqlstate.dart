import 'package:freezed_annotation/freezed_annotation.dart';

part 'savetosqlstate.freezed.dart';

@freezed
class SaveToSqlState with _$SaveToSqlState {
  factory SaveToSqlState.initial() = _Initial;
  factory SaveToSqlState.loading() = _Loading;
  factory SaveToSqlState.success() = _Success;
  factory SaveToSqlState.failed() = _Failed;
}
