import 'package:flutter/material.dart';
import 'board-save-app-bar-btn.dart';

class BoardSaveAppBar extends StatelessWidget {
  final VoidCallback onSave;

  BoardSaveAppBar({required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 25),
      child: InkWell(
        onTap: onSave,
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: BoardSaveAppBarBtn(55, Colors.black54, "완료"),
            ),
          ],
        ),
      ),
    );
  }
}