import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AnnouncementTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: VxSwiper(
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        items: [
          ProjectWidget(image: "assets/images/cover_banner.jpg",),
          ProjectWidget(image: "assets/images/cover_banner.jpg",),
          ProjectWidget(image: "assets/images/cover_banner.jpg",),
        ],
        height: 300,
        viewportFraction: context.isMobile ? 0.80 : 1.9,
        autoPlay: true,
        autoPlayAnimationDuration: 1.seconds,
      ).h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String image;

  const ProjectWidget({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 400,
            child: Image.asset(image, width: 200, height: 200,)),
      ),
    );
  }
}