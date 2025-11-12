import 'package:flutter/material.dart';
import 'package:suits_app/core/utils/router/app_routes.dart';

void main() {
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
