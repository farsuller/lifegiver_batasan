import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/shared/draw_clip.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/helper/ui_helper.dart';

class WaveBackground extends StatelessWidget {
  const WaveBackground({
    Key key,
    @required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return ClipPath(
              clipper: DrawClip3(_controller.value),
              child: Container(
                height: SizeConfig.screenHeight * 0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [quepalStart, quepalEnd]),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return ClipPath(
              clipper: DrawClip(_controller.value),
              child: Container(
                height: SizeConfig.screenHeight * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [mojitoStart, mojitoEnd]),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return ClipPath(
              clipper: DrawClip2(_controller.value),
              child: Container(
                height: SizeConfig.screenHeight * 0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [earthlyStart, earthlyEnd]),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}