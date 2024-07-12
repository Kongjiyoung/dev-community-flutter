import 'package:flutter/material.dart';

class ProfileSettingInfo extends StatelessWidget {
  const ProfileSettingInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("example@nate.com",
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                SizedBox(height: 5),
                Text("카카오 간편 가입"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
