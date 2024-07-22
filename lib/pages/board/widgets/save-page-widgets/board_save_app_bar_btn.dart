import 'package:flutter/material.dart';

class BoardSaveAppBarBtn extends StatelessWidget {
  final double width;
  final Color color;
  final String text;

  BoardSaveAppBarBtn(this.width, this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}