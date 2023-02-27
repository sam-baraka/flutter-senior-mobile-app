import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class PhoneCodeInputPage extends ConsumerWidget {
  const PhoneCodeInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 200,
          ),
          const Text(
            'Enter your phone number to Join Amitruck',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          FormBuilderField(
              builder: (field) {
                return PinInputTextField(
                    pinLength: 4,
                    decoration: UnderlineDecoration(
                      colorBuilder:
                          PinListenColorBuilder(Colors.purple, Colors.purple),
                      obscureStyle: ObscureStyle(
                        obscureText: '😂',
                      ),
                    ));
              },
              name: 'code'),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PhoneCodeInputPage();
              }));
            },
            color: Colors.purple,
            child: const Text(
              'Validate and Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Expanded(child: SizedBox()),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.grey,
            child: const Text(
              '< Go back',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
