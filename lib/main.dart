import 'package:flutter/material.dart';
import 'package:real_estate_agency/core/database/database.dart';
import 'package:real_estate_agency/core/navigation/router.dart';

late LocalDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = LocalDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
