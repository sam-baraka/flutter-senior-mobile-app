import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderFormPage extends ConsumerWidget {
  OrderFormPage({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    const Icon(Icons.dehaze),
                    Expanded(child: Container())
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
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OrderFormPage();
                    }));
                  },
                  color: Colors.purple,
                  child: const Text(
                    'Confirm & Order a Trip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
      decoration: InputDecoration(
          labelText: hint,
          hintText: label,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple))),
    );
  }
}
