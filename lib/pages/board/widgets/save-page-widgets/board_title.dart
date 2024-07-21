import 'package:flutter/material.dart';

class BoardTitle extends StatelessWidget {
  const BoardTitle({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: "제목을 입력하세요.",
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}