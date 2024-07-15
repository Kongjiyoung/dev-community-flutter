import 'package:dev_community/pages/auth/join.dart';
import 'package:dev_community/pages/auth/login.dart';
import 'package:dev_community/pages/auth/welcome_page.dart';
import 'package:dev_community/pages/home/home_page.dart';
import 'package:dev_community/pages/home/popular-post-page.dart';
import 'package:dev_community/pages/home/saved-post-page.dart';
import 'package:dev_community/pages/main_page.dart';
import 'package:dev_community/pages/my/pages/my_page.dart';
import 'package:dev_community/pages/my/pages/profile_update.dart';
import 'package:flutter/material.dart';

class Move {
  static String welcomePage = "/welcome";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String mainPage = "/main";
  static String homePage = "/home";
  static String myPage = "/my";
  static String profileUpdatePage = "/profile-update-page";
  static String savedPostPage = "/savedPost";
  static String popularPostPage = "/popularPost";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.welcomePage: (context) => const WelcomePage(),
    Move.loginPage: (context) => const LoginPage(),
    Move.joinPage: (context) => const JoinPage(),
    Move.mainPage: (context) => const MainPage(),
    Move.homePage: (context) => const HomePage(),
    Move.myPage: (context) => const MyPage(),
    Move.profileUpdatePage: (context) => const ProfileUpdatePage(),
    Move.savedPostPage: (context) => SavedPostPage(),
    Move.popularPostPage: (context) => PopularPostPage(),
  };
}
