import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final Function() onConfirm;

  ConfirmDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("게시글을 신고하시겠습니까?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
          child: Text("아니오"),
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // 확인 콜백 호출
            Navigator.of(context).pop(); // 다이얼로그 닫기
          },
          child: Text("예"),
        ),
      ],
    );
  }
}
