import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';

class SavePage extends StatefulWidget {
  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final TextEditingController titleController = TextEditingController();
  final quill.QuillController quillController = quill.QuillController.basic();
  final ScrollController _editorScrollController = ScrollController();
  final FocusNode _editorFocusNode = FocusNode();
  final picker = ImagePicker();
  List<XFile> images = [];
  List<ImageProvider<Object>> _profileImages = [];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(pickedFile);
        _profileImages.add(FileImage(File(pickedFile.path)));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
      _profileImages.removeAt(index);
    });
  }

  void _showImageDialog(ImageProvider<Object> imageProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              child: Image(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePreview(int index, ImageProvider<Object> imageProvider) {
    return GestureDetector(
      onTap: () => _showImageDialog(imageProvider),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            width: 30,
            height: 30,
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _printContent() {
    final title = titleController.text;
    final content = quillController.document.toDelta().toJson();
    final imagePaths = images.map((image) => image.path).join(', ');

    print('제목: $title');
    print('내용: $content');
    print('이미지 경로: $imagePaths');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BoardSaveAppBar(onSave: _printContent),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Colors.grey[300]!,
                ),
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
            BoardTitle(titleController: titleController),
            SizedBox(height: 10),
            Divider(thickness: 1, color: Colors.grey),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      BoardContent(quillController: quillController),
                      IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.image),
                        tooltip: '이미지 삽입',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  BoardContent2(quillController: quillController, editorScrollController: _editorScrollController, editorFocusNode: _editorFocusNode),
                  SizedBox(height: 10),
                  if (_profileImages.isNotEmpty)
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(_profileImages.length, (index) {
                          return _buildImagePreview(index, _profileImages[index]);
                        }),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoardContent2 extends StatelessWidget {
  const BoardContent2({
    super.key,
    required this.quillController,
    required ScrollController editorScrollController,
    required FocusNode editorFocusNode,
  }) : _editorScrollController = editorScrollController, _editorFocusNode = editorFocusNode;

  final quill.QuillController quillController;
  final ScrollController _editorScrollController;
  final FocusNode _editorFocusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: quill.QuillEditor(
          configurations: quill.QuillEditorConfigurations(
            controller: quillController,
            customStyles: quill.DefaultStyles(
              paragraph: quill.DefaultTextBlockStyle(
                TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                const quill.VerticalSpacing(0, 0),
                const quill.VerticalSpacing(0, 0),
                null,
              ),
            ),
          ),
          scrollController: _editorScrollController,
          focusNode: _editorFocusNode,
        ),
      ),
    );
  }
}

class BoardContent extends StatelessWidget {
  const BoardContent({
    super.key,
    required this.quillController,
  });

  final quill.QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: quill.QuillToolbar.simple(
        configurations: quill.QuillSimpleToolbarConfigurations(
          controller: quillController,
          showDividers: true,
          showFontFamily: false,
          showFontSize: false,
          showBoldButton: true,
          showItalicButton: true,
          showSmallButton: false,
          showUnderLineButton: true,
          showLineHeightButton: false,
          showStrikeThrough: true,
          showInlineCode: true,
          showColorButton: true,
          showBackgroundColorButton: false,
          showClearFormat: false,
          showAlignmentButtons: false,
          showLeftAlignment: false,
          showCenterAlignment: false,
          showRightAlignment: false,
          showJustifyAlignment: false,
          showHeaderStyle: false,
          showListNumbers: false,
          showListBullets: false,
          showListCheck: false,
          showCodeBlock: false,
          showQuote: false,
          showIndent: false,
          showLink: false,
          showUndo: false,
          showRedo: false,
          showDirection: false,
          showSearchButton: false,
          showSubscript: false,
          showSuperscript: false,
          showClipboardCut: false,
          showClipboardCopy: false,
          showClipboardPaste: false,
        ),
      ),
    );
  }
}

class BoardTitle extends StatelessWidget {
  const BoardTitle({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: "제목을 입력하세요.",
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

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

class BoardSaveAppBarBtn extends StatelessWidget {
  final double width;
  final Color color;
  final String text;

  BoardSaveAppBarBtn(this.width, this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
