import 'package:dev_community/pages/home/home_page.dart';
import 'package:dev_community/pages/my/my_page.dart';
import 'package:dev_community/pages/qna/qna_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/bottom_navigation_bar.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          MyPage(),
          QAndAPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }AppBar _buildProfileAppBar() {
    return AppBar(

      actions: <Widget>[
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_outlined,size: 30),

          ), // 종 모양 아이콘
          onPressed: () {
          },
        ),
      ],
    );
  }

}

