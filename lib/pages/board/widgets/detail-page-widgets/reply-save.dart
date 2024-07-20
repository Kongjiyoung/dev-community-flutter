import 'package:dev_community/pages/board/widgets/detail-page-widgets/profile-image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dtos/repository/reply_repository.dart';
import '../../../../dtos/reply/reply_request.dart';
import '../../viewmodal/board-detail-viewmodel.dart';

class ReplySave extends ConsumerStatefulWidget {
  final String profileImg;
  final int boardId;

  ReplySave(this.profileImg, this.boardId);

  @override
  _ReplySaveState createState() => _ReplySaveState();
}

class _ReplySaveState extends ConsumerState<ReplySave> {
  final TextEditingController _commentController = TextEditingController();

  Future<void> _submitComment() async {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) {
      // 댓글이 비어 있으면 아무 것도 하지 않음
      return;
    }

    try {
      final replyRepository = ReplyRepository();
      final responseDTO = await replyRepository.replySave(widget.boardId, ReplySaveDTO(comment));

      if (responseDTO.status == 200) {
        // 댓글 작성 성공

        _commentController.clear(); // 입력 필드 초기화

        // 필요하다면 댓글 목록을 갱신하거나 다른 상태 업데이트를 수행할 수 있습니다.
        // 댓글 작성 후 게시글 상세정보를 다시 로드하여 상태를 업데이트
        ref.read(boardDetailProvider(widget.boardId).notifier).addReply(widget.boardId);
      } else {
        // 댓글 작성 실패
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("댓글 작성 실패: ${responseDTO.msg}")),
        );
      }
    } catch (e) {
      // 오류 발생 시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("댓글 작성 중 오류가 발생했습니다.")),
      );
      print('Error: $e');
    }
  }

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
                      onPressed: _submitComment,
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
