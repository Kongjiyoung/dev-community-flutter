import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  final profileImage;
  final nickname;
  final introduce;

  MyInfo(
      {this.profileImage = "assets/images/profile.jpeg",
      required this.nickname,
      this.introduce = "소개 없음"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Image.asset(
            profileImage,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nickname, style: inputTitleStyle(size: 25)),
            SizedBox(height: 10),
            Text(
              introduce,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
