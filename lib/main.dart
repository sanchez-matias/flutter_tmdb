import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/config/router.dart';
import 'package:flutter_tmdb/core/services/key_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  await SessionIdStorage.initPrefs();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initializeDateFormatting();

    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'TMDB',
      theme: ThemeData(colorSchemeSeed: Colors.pink),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
