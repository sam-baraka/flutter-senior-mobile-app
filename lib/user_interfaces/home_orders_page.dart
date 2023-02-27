import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_amitruck/database_client/database_client.dart';

class HomeOrdersPage extends ConsumerWidget {
  const HomeOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: FutureBuilder(
          future: DatabaseClient().getRows(),
          builder: (snapsh, con) {
            if (con.hasData) {
              return ListView(
                children: con.data!
                    .map((e) => ListTile(title: Text(jsonEncode(e['data']))))
                    .toList(),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
