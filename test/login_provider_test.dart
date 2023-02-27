// A Counter implemented and tested with Dart only (no dependency on Flutter)

// We declared a provider globally, and we will use it in two tests, to see
// if the state correctly resets to `0` between tests.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_amitruck/providers/login/login_provider.dart';
import 'package:interview_amitruck/providers/login/loginstate.dart';
import 'package:mockito/mockito.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener extends Mock {
  void call(LoginState? previous, LoginState value);
}

void main() {
  test(
      'defaults to Initial Login State and notify listeners when value changes',
      () {
    // An object that will allow us to read providers
    // Do not share this between tests.
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    // Observe a provider and spy the changes.
    container.listen<LoginState>(
      loginProvider,
      listener,
      fireImmediately: true,
    );

    // the listener is called immediately with 0, the default value
    verify(listener(null, LoginState.initial())).called(1);
    verifyNoMoreInteractions(listener);

    // We increment the value
    container.read(loginProvider.notifier).login();

    // The listener was called again, but with 1 this time
    verify(listener(LoginState.initial(), LoginState.loading())).called(1);
    verifyNoMoreInteractions(listener);
  });
}
