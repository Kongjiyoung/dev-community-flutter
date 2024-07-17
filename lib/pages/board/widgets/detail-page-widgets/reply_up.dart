import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-content.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:flutter/material.dart';

class ReplyUp extends StatelessWidget {
  var profileImg;
  var name;
  var content;

  ReplyUp(this.profileImg, this.name, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfileImage(profileImg),
          SizedBox(width: 10),
          ProfileContent(name, content),
          Spacer(),
        ],
      ),
    );
  }
}