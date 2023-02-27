import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:interview_amitruck/providers/login_provider.dart';
import 'package:interview_amitruck/user_interfaces/order_form_page.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class PhoneCodeInputPage extends ConsumerWidget {
  PhoneCodeInputPage({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (t, y) {
      y.maybeWhen(
          orElse: () {},
          success: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OrderFormPage();
            }));
          });
    });
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: formKey,
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
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required()]),
                builder: (field) {
                  return PinInputTextField(
                      pinLength: 4,
                      onChanged: (value) {
                        field.didChange(value);
                      },
                      decoration: UnderlineDecoration(
                        colorBuilder:
                            PinListenColorBuilder(Colors.purple, Colors.purple),
                        obscureStyle: ObscureStyle(
                          obscureText: '😂',
                        ),
                      ));
                },
                name: 'code'),
            ref.watch(loginProvider).maybeWhen(
              orElse: () {
                return MaterialButton(
                  onPressed: () {
                    ref.read(loginProvider.notifier).login();
                  },
                  color: Colors.purple,
                  child: const Text(
                    'Validate and Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
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
      ),
    ));
  }
}
