import 'package:flutter/material.dart';


class SavePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BoardSaveAppBar(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ), // 윤곽선 스타일 및 색상
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "제목을 입력하여주세요.",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ), // 힌트 텍스트 스타일
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ), // 입력한 텍스트 스타일
            ),
            SizedBox(height: 10), // 제목과 내용 사이에 공간 추가
            Divider(thickness: 1, color: Colors.grey), // 제목과 내용 사이의 밑줄
            SizedBox(height: 10), // 밑줄과 내용 사이에 공간 추가
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: TextField(
                    controller: contentController,
                    maxLines: null, // 여러 줄 입력 가능
                    decoration: InputDecoration(
                      hintText: "내용을 입력하여주세요.",
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      // 힌트 텍스트 스타일
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ), // 입력한 텍스트 스타일
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Container(
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class BoardSaveAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            BoardSaveAppBarBtn(55, Colors.black54, "완료"),
            SizedBox(width: 10),
            BoardSaveAppBarBtn(65, Colors.red, "신고하기"),
          ],
        ),
      ),
    );
  }
}

class BoardSaveAppBarBtn extends StatelessWidget {
  double width;
  final color;
  final text;

  BoardSaveAppBarBtn(this.width, this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        // 텍스트를 중앙 정렬
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // 텍스트 색상
            fontWeight: FontWeight.w600, // 글꼴 굵기
            fontSize: 16.0, // 글꼴 크기
          ),
        ),
      ),
    );
  }
}
