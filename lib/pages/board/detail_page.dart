import 'dart:convert';
import 'package:dev_community/pages/board/viewmodal/board_detail_viewmodel.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/board_all.dart';
import 'package:dev_community/pages/board/widgets/detail-page-widgets/reply-save.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerStatefulWidget {
  final boardId;

  BoardDetailPage(this.boardId);

  @override
  _BoardDetailPageState createState() => _BoardDetailPageState(boardId);
}

class _BoardDetailPageState extends ConsumerState<BoardDetailPage> {
  final boardId;

  late quill.QuillController _quillController;

  _BoardDetailPageState(this.boardId); // dynamicText 변수 추가

  @override
  void initState() {
    super.initState();
  }

  void loadContent(String jsonString) {
    var document = quill.Document.fromJson(jsonDecode(jsonString));
    _quillController = quill.QuillController(
      document: document,
      selection: TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    BoardDetailModel? model = ref.watch(boardDetailProvider(boardId));
    BoardDetailViewModel viewmodel =
        ref.read(boardDetailProvider(boardId).notifier);

    if (model == null) {
      return const Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black26)));
    } else {
      final boardContent = model.boardDetailDTO.boardContent;
      loadContent(boardContent); // Quill 컨트롤러를 초기화
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (model.isChanged == true) {
                ref.read(homeBoardListProvider.notifier).notifyInit();
              }
              Navigator.of(context).pop();
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 5.0,
                    color: Color(0x8188ff56),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            BoardAll(
              viewmodel: viewmodel,
              boardDetailDTO: model.boardDetailDTO,
              quillController: _quillController,
            ),
            ReplySave(model.boardDetailDTO.sessionUserImg,
                model.boardDetailDTO.boardId, viewmodel),
          ],
        ),
      );
    }
  }
}
