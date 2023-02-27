import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'user_interfaces/welcome_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase('amitruck_database.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE amitruck_table (id INTEGER PRIMARY KEY, data TEXT)');
  });

  /// Register the database as a singleton
  GetIt.I.registerSingleton<Database>(database);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: const WelcomePage(),
        theme: ThemeData(
            primaryColor: Colors.purple, primarySwatch: Colors.purple),
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
      ),
    );
  }
}
