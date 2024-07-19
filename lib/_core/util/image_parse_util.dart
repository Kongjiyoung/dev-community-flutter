import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String> encodeXFileToBase64(XFile image) async {
  // XFile에서 File 객체로 변환
  File file = File(image.path);

  // 파일을 바이너리 데이터로 읽어오기
  List<int> fileBytes = await file.readAsBytes();

  // base64로 인코딩
  String base64Image = base64Encode(fileBytes);

  return base64Image;
}
