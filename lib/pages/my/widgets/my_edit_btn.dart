import 'package:dev_community/_core/constants/move.dart';
import 'package:flutter/material.dart';

class MyEditBtn extends StatelessWidget {
  const MyEditBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(Color(0xffa2d594)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, Move.profileUpdatePage);
      },
      child: Text("편집"),
    );
  }
}
