import 'package:dev_community/_core/constants/style.dart';
import 'package:flutter/material.dart';

BorderRadius circularBorder() {
  return BorderRadius.circular(10);
}

TextStyle inputTitleStyle(
    {double? size = 17, Color? fontColor = Colors.black}) {
  return TextStyle(
    color: fontColor,
    fontWeight: FontWeight.w900,
    fontSize: size,
  );
}

InputDecoration authInputDeco({String? hintText}) {
  return InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    hintText: hintText,
  );
}

ButtonStyle authBtnStyle({Color? color = btnColor}) {
  return ElevatedButton.styleFrom(
    backgroundColor: color, // 배경색 설정
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // 둥근 모서리 설정
    ),
    padding: const EdgeInsets.symmetric(
        horizontal: 50.0, vertical: 20.0), // 버튼 패딩 설정
  );
}
