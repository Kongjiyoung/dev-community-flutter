import 'package:flutter/material.dart';

class MyProfileSettingInput extends StatelessWidget {
  final inputTitle;
  final hintText;

  MyProfileSettingInput(this.inputTitle, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Container(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
                child: Text(inputTitle, style: TextStyle(fontSize: 15)),
                width: 80),
            SizedBox(width: 10),
            Expanded(
                child: TextFormField(
                    decoration: InputDecoration(hintText: hintText))),
          ],
        ),
      ),
    );
  }
}
