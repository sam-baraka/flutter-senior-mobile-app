import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_amitruck/database_client/database_client.dart';
import 'package:interview_amitruck/user_interfaces/order_form_page.dart';

class HomeOrdersPage extends ConsumerWidget {
  const HomeOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OrderFormPage();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: FutureBuilder(
          future: DatabaseClient().getRows(),
          builder: (snapsh, con) {
            if (con.hasData) {
              return ListView(
                children: con.data!.map((e) {
                  String x = e['data'];
                  var y = x.replaceAll('=', ':');
                  Map<String, dynamic> data = jsonDecode(y);
                  return ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(data['pickup_point']),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Drop off point :${data['drp_off_point']}'),
                                  Text('Pickup point :${data['pickup_point']}'),
                                  Text(
                                      'Delivery instructions:${data['delivery_instructions']}'),
                                  Text('Weight:${data['weight']} KGs'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'))
                              ],
                            );
                          });
                    },
                    leading: const Icon(
                      Icons.delivery_dining,
                      color: Colors.purple,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purple,
                    ),
                    title: Text(data['pickup_point']),
                    subtitle: Text(data['delivery_instructions'] ?? ''),
                  );
                }).toList(),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
