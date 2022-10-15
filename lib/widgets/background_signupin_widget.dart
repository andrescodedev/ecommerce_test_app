import 'package:flutter/material.dart';

class BackgroundSignInUpWidget extends StatelessWidget {
  const BackgroundSignInUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.4,
      color: Colors.indigo,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: screenSize.height * 0.05),
    );
  }
}
