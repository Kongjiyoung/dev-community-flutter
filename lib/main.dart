import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/pages/auth/welcome_page.dart';
import 'package:dev_community/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: WelcomePage(),
      routes: getRouters(),
    );
  }
}
