import 'package:flutter/material.dart';

class UpperRight extends StatelessWidget {
  final IconData iconData; // IconData 타입의 변수 선언
  final double size; // 아이콘 크기 변수 선언
  final Color color;
  final VoidCallback onTap;

  UpperRight(this.iconData, this.size, this.color,
      {required this.onTap}); // 아이콘 색상 변수 선언

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        size: size,
        color: color,
      ),
    );
  }
}

