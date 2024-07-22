import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply_all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import '../../../../dtos/board/board_response.dart';
import '../../viewmodal/board_detail_viewmodel.dart';
import 'content.dart';

class Board extends StatelessWidget {
  final String title;
  final quill.QuillController _quillController;
  final int boardHit;
  final List<BoardImagesDTO> images;
  final String createdAt;
  final int replyCount;
  final int likeCount;
  final int boardId;
  final bool isLiked;
  final List<ReplyDTO> replies;
  final BoardDetailViewModel viewmodel;

  const Board({
    required this.title,
    required quill.QuillController quillController,
    required this.createdAt,
    required this.replyCount,
    required this.images,
    required this.boardHit,
    required this.replies,
    required this.viewmodel,
    required this.isLiked,
    required this.likeCount,
    required this.boardId,
  }) : _quillController = quillController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          // Main content with scrollable area
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                MyTitle(title: title),
                Content2(
                  quillController: _quillController,
                  isLiked: isLiked,
                  images: images,
                  viewmodel: viewmodel,
                  likeCount: likeCount,
                  boardId: boardId,
                ),
                ReplyAll(
                  replies: replies,
                  boardHit: boardHit,
                  createdAt: createdAt,
                  replyCount: replyCount,
                ),
                SizedBox(height: 50), // This adds spacing at the bottom
              ],
            ),
          ),
          // Fixed container at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50, // Adjust the height as needed
              color: Colors.white, // Adjust the color as needed
              child: Center(
                child: Text(
                    'Fixed Footer Content'), // Replace with your desired widget
              ),
            ),
          ),
        ],
      ),
    );
  }
}
