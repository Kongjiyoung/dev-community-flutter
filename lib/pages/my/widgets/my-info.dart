import 'package:dev_community/_core/constants/custom-widgets.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    super.key,
  });

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
            "../assets/images/profile.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("지영", style: inputTitleStyle(size: 25)),
            SizedBox(height: 10),
            Text(
              "그냥대학교 컴퓨터공학과",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
