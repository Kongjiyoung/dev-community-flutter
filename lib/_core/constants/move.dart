import 'package:dev_community/pages/auth/join.dart';
import 'package:dev_community/pages/auth/login.dart';
import 'package:dev_community/pages/auth/welcome_page.dart';
import 'package:dev_community/pages/home/home_page.dart';
import 'package:dev_community/pages/my/my_page.dart';
import 'package:dev_community/pages/qna/qna_page.dart';
import 'package:flutter/material.dart';

class Move {
  static String welcomePage = "/welcome";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String homePage = "/home";
  static String myPage = "/my";
  static String qnaPage = "/qna";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.welcomePage: (context) => const WelcomePage(),
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.homePage: (context) => const HomePage(),
    Move.myPage: (context) => const MyPage(),
    Move.qnaPage: (context) => const QAndAPage(),
  };
}
