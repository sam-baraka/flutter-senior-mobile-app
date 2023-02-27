import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:interview_amitruck/user_interfaces/phone_code_input_page.dart';

class PhoneNumberInputPage extends ConsumerWidget {
  PhoneNumberInputPage({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            FormBuilderPhoneField(
              name: 'phone_number',
              defaultSelectedCountryIsoCode: 'KE',
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '712345782',
              ),
              priorityListByIsoCode: const ['KE'],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.min(9)
              ]),
            ),
            Semantics(
              label: 'Next',
              child: MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.saveAndValidate()) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PhoneCodeInputPage();
                    }));
                  }
                },
                color: Colors.purple,
                child: const Text(
                  'Confirm and Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            CupertinoButton(
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
