import 'package:flutter/material.dart';

class MyProfileSettingEditButton extends StatelessWidget {
  const MyProfileSettingEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextButton(
        onPressed: () {},
        child: Text("수정하기"),
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
        ),
      ),
    );
  }
}
