import 'package:fitstart/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:fitstart/providers/user_provider.dart';
import 'package:fitstart/constants/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const FitStartApp(),
    ),
  );
}

class FitStartApp extends StatelessWidget {
  const FitStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitStart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
