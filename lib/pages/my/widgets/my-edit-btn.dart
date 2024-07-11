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
        backgroundColor: WidgetStatePropertyAll(Colors.grey[300]),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: () {},
      child: Text("편집"),
    );
  }
}
