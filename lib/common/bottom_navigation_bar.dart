import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), //
          topRight: Radius.circular(20), //
        ),

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red,
          onTap: onItemSelected,
          items: const [
            BottomNavigationBarItem(
                label: "홈", icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(
                label: "현직자 Q&A", icon: Icon(Icons.message)),
            BottomNavigationBarItem(
                label: "마이페이지", icon: Icon(Icons.people)),
          ],
        ),
      ),
    );
  }
}
