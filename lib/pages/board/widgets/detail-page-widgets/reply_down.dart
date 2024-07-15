import 'package:flutter/material.dart';

class ReplyDown extends StatelessWidget {
  var comment;

  ReplyDown(this.comment);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 5, 0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            comment,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}