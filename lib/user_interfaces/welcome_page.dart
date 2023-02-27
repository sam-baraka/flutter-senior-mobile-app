import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The welcome page which extends the consumer widget to provide access to a
/// [WidgetRef] instance to access providers whenever needed
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text('Welcome to Amitruck Driver'),
        MaterialButton(
          onPressed: () {},
          color: Colors.purple,
          child: const Text(
            'Accept T&C and continue',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
