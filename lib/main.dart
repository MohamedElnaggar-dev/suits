import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';
import 'package:suits_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SuitsApp());
}

class SuitsApp extends StatelessWidget {
  const SuitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
