import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginstate.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.initial() = _Initial;
  factory LoginState.loading() = _Loading;
  factory LoginState.success() = _Success;
  factory LoginState.failed(String error) = _Failed;
}
