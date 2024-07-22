import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dtos/repository/reply_repository.dart';
import '../../../../dtos/reply/reply_request.dart';
import '../../viewmodal/board_detail_viewmodel.dart';

class ReplySave extends ConsumerStatefulWidget {
  final String profileImg;
  final int boardId;
  final BoardDetailViewModel viewmodel;

  ReplySave(
    this.profileImg,
    this.boardId,
    this.viewmodel
  );

  @override
  _ReplySaveState createState() => _ReplySaveState();
}

class _ReplySaveState extends ConsumerState<ReplySave> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ProfileImage(widget.profileImg),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: '여기에 댓글을 입력하세요.',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () async {
                        if (_commentController.text.isEmpty) {
                          // 댓글이 비어 있으면 아무 것도 하지 않음
                          return;
                        }
                        bool success = await widget.viewmodel.replySave(widget.boardId, _commentController.text);
                        if (success) {
                          _commentController.clear();
                        }
                      },
                      child: Text(
                        '등록',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
