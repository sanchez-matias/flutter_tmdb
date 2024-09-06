import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/config/router.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return MaterialApp.router(
      title: 'TMDB',
      theme: ThemeData(colorSchemeSeed: Colors.pink),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
