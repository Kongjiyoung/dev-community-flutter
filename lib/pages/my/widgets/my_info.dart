import 'package:dev_community/_core/constants/custom_widgets.dart';
import 'package:dev_community/_core/constants/http.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  final String? profileImage;
  final String nickname;
  final String? position;
  final String? introduce;

  MyInfo({
    this.profileImage,
    required this.nickname,
    this.position,
    this.introduce,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: profileImage == null
                  ? Image.asset(
                      "assets/images/profile.jpeg",
                      fit: BoxFit.cover,
                    )
                  : Image.network(serverAddress + profileImage!),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nickname, style: inputTitleStyle(size: 25)),
                SizedBox(height: 10),
                Text(position ?? "포지션 없음", style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          height: 125,
          alignment: AlignmentDirectional.topStart,
          child: Text(introduce ?? "소개 없음"),
        ),
      ],
    );
  }
}
