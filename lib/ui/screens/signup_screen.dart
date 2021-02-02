
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/ui/viewmodels/signup_screen_vm.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';

import 'shared/draw_clip.dart';
import 'shared/ui_helpers.dart';


class SignUpView extends StatefulWidget {

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children:[
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

              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.04,
                    vertical: SizeConfig.screenHeight * 0.05),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowGlow();
                    return;
                  },
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Sign Up', style: TextStyle(fontSize: 38,),
                      ),
                      verticalSpaceLarge,
                      InputField(
                        placeholder: 'Email',
                        controller: emailController,
                      ),
                      verticalSpaceSmall,
                      InputField(
                        placeholder: 'Password',
                        password: true,
                        controller: passwordController,
                        additionalNote: 'Password has to be a minimum of 6 characters.',
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BusyButton(
                            width: 40.0,
                            height: 40.0,
                            title: 'Sign Up',
                            busy: model.busy,
                            onPressed: () {
                              model.signUp(
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                          )
                        ],
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BusyButton(
                            width: 40.0,
                            height: 40.0,
                            title: 'Back to Login',
                            busy: model.busy,
                            onPressed:()=> Get.offNamed("/login"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
