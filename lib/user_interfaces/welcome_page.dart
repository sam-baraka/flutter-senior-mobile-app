import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_amitruck/user_interfaces/phone_number_input_page.dart';
import 'package:url_launcher/url_launcher.dart';

/// The welcome page which extends the consumer widget to provide access to a
/// [WidgetRef] instance to access providers whenever needed
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            const Text(
              'Welcome to Amitruck Driver',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'A Simple, Reliable Logistics App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const Expanded(child: SizedBox()),
            Text.rich(
              TextSpan(
                  text: 'Terms and Conditions',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await launchUrl(Uri.parse('https://www.amitruck.com/'));
                    },
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  )),
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PhoneNumberInputPage();
                }));
              },
              color: Colors.purple,
              child: const Text(
                'Accept T&C and continue',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
