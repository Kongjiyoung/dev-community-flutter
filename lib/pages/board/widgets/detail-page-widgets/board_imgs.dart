import 'package:dev_community/dtos/board/board_response.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/http.dart';

class BoardImgs extends StatelessWidget {
  var count;
  var filePath;

  BoardImgs(this.count, this.filePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,  // 이미지 높이를 설정합니다.
      child: PageView.builder(
        itemCount: count,  // 페이지 수를 설정합니다.
        itemBuilder: (context, index) {
          BoardImagesDTO images = filePath[index];
          return Center(
            child: Image.network(
              serverAddress + images.filePath,
              width: 250,
            ),
          );
        },
      ),
    );
  }
}