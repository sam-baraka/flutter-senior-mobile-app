import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:interview_amitruck/database_client/database_client.dart';
import 'package:interview_amitruck/providers/sql/save_to_sql_provider.dart';
import 'package:interview_amitruck/user_interfaces/home_orders_page.dart';

class OrderFormPage extends ConsumerWidget {
  OrderFormPage({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(saveToSqlProvider, (t, y) {
      y.whenOrNull(
        success: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Success"),
                      Text('Saved to DB successfully'),
                    ],
                  ),
                );
              });
        },
      );
    });
    return FormBuilder(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.dehaze),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const HomeOrdersPage();
                            }));
                          },
                          icon: Semantics(
                              label: 'iconTap',
                              child: const Icon(Icons.fire_truck_outlined)))
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  const Text(
                    'Fill Below To Order',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    name: 'pickup_point',
                    hint: 'Pickup point',
                    label: 'The Address, Waiyaki Way, Westlands',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    name: 'drp_off_point',
                    hint: 'Drop-off point',
                    label: 'The Address, Waiyaki Way, Westlands',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    name: 'weight',
                    hint: 'Est. Weight (KGs)',
                    label: '0.00',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    name: 'delivery_instructions',
                    hint: 'Delivery Instructions',
                    label: 'Call me here',
                    keyboardType: TextInputType.none,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ref.watch(saveToSqlProvider).maybeWhen(orElse: () {
                    return MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.saveAndValidate()) {
                          ref
                              .read(saveToSqlProvider.notifier)
                              .saveToSql(data: formKey.currentState!.value);
                        }
                      },
                      color: Colors.purple,
                      child: const Text(
                        'Confirm & Order a Trip',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}

class TextField extends ConsumerWidget {
  const TextField(
      {super.key,
      required this.name,
      required this.hint,
      required this.label,
      required this.keyboardType});
  final String name;
  final String hint;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      decoration: InputDecoration(
          labelText: hint,
          hintText: label,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple))),
    );
  }
}
