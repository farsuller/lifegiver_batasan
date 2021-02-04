import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.black,
      ).mdClick(() {
        launch("https://twitter.com/ArnoldSuller");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.black,
      ).mdClick(() {
        launch("https://instagram.com/florenzearnold");
      }).make(),
      20.widthBox,
     Icon(AntDesign.youtube, color: Colors.black,).mdClick(() {
       launch("https://www.youtube.com/channel/UCQCv55xTANwPW9kz8SMDMBA");
     }).make(),
     20.widthBox,
      Icon(
        AntDesign.facebook_square,
        color: Colors.black,
      ).mdClick(() {
        launch("https://web.facebook.com/groups/626383381316779");
      }).make()
    ].hStack();
  }
}