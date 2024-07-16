import 'package:flutter/material.dart';

class BoardImgs extends StatelessWidget {
  var count;
  var imgPath;

  BoardImgs(this.count, this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,  // 이미지 높이를 설정합니다.
      child: PageView.builder(
        itemCount: count,  // 페이지 수를 설정합니다.
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(
              imgPath,
              width: 250,  // 이미지의 너비를 설정합니다.
            ),
          );
        },
      ),
    );
  }
}