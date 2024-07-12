import 'package:flutter/material.dart';

class OauthLoginButton extends StatelessWidget {
  final assetImage;

  OauthLoginButton(this.assetImage);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.6,
        // height: MediaQuery.of(context).size.height * 0.07,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(assetImage),
          ),
        ),
      ),
    );
  }
}
