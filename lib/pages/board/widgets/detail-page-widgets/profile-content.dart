import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  var name;
  var content;

  ProfileContent(this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          content,
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ],
    );
  }
}

