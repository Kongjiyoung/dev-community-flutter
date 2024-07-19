import 'dart:convert';
import 'dart:io';
import 'package:dev_community/_core/util/image_parse_util.dart';
import 'package:dev_community/dtos/board/board-request.dart';
import 'package:dev_community/pages/board/widgets/save-page-widgets/board-content.dart';
import 'package:dev_community/pages/board/widgets/save-page-widgets/board-content2.dart';
import 'package:dev_community/pages/board/widgets/save-page-widgets/board-save-app-bar.dart';
import 'package:dev_community/pages/board/widgets/save-page-widgets/board-title.dart';
import 'package:dev_community/pages/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';

class SavePage extends StatefulWidget {
  final HomeViewmodel viewmodel;

  SavePage(this.viewmodel);

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  late final HomeViewmodel viewmodel;
  final TextEditingController titleController = TextEditingController();
  final quill.QuillController quillController = quill.QuillController.basic();
  final ScrollController _editorScrollController = ScrollController();
  final FocusNode _editorFocusNode = FocusNode();
  final picker = ImagePicker();
  List<XFile> images = [];
  List<ImageProvider<Object>> _profileImages = [];
  List<ImagesDTO> imageList = [];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // 비동기 작업을 setState 호출 밖에서 처리
      final base64Data = await encodeXFileToBase64(pickedFile);
      final imageProvider = FileImage(File(pickedFile.path));

      setState(() {
        images.add(pickedFile);
        imageList.add(ImagesDTO(
            imageData: base64Data,
            fileName: images.map((image) => image.path).join(', ')));
        _profileImages.add(imageProvider);
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

  @override
  void initState() {
    super.initState();
    viewmodel = widget.viewmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BoardSaveAppBar(
            viewmodel: viewmodel,
            saveBoardDTO: SaveBoardDTO(
              title: titleController.text,
              content: jsonEncode(quillController.document.toDelta().toJson()),
              images: imageList,
            ),
          ),
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
                  BoardContent2(
                    quillController: quillController,
                    editorScrollController: _editorScrollController,
                    editorFocusNode: _editorFocusNode,
                  ),
                  SizedBox(height: 10),
                  if (_profileImages.isNotEmpty)
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(_profileImages.length, (index) {
                          return _buildImagePreview(
                              index, _profileImages[index]);
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
