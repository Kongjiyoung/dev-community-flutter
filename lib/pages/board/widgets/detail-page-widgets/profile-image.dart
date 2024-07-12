import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  var imgPath;

  ProfileImage(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imgPath),
            ),
          ],
        ),
      ),
    );
  }
}