import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_amitruck/providers/login/loginstate.dart';

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>(
    (ref) => LoginProvider(LoginState.initial()));

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider(super.state);

  login() async {
    state = LoginState.loading();
    await Future.delayed(const Duration(seconds: 3));
    state = LoginState.success();
  }
}
