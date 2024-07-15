import 'package:dev_community/_core/constants/move.dart';
import 'package:dev_community/pages/board/detail_page.dart';
import 'package:dev_community/pages/main_page.dart';
import 'package:dev_community/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: BoardDetailPage(),
      routes: getRouters(),
    );
  }
}
