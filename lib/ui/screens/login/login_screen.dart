
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/screens/shared/draw_clip.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/ui/widgets/text_link.dart';
import 'package:lifegiver_batasan/ui/viewmodels/login_screen_vm.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool emailInvalid = false;

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

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: bgColor,
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
                              colors: [quepalStart, quepalEnd]),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.05),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){
                      overScroll.disallowGlow();
                      return;
                    },
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                          child: Image.asset('assets/lifegiver_login.png'),
                        ),
                        verticalSpaceLarge,
                        verticalSpaceLarge,
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
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BusyButton(
                              width: 40.0,
                              height: 40.0,
                              title: 'Login',
                              busy: model.busy,
                              onPressed: () {
                                model.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                            )
                          ],
                        ),
                        verticalSpaceMedium,

                        Center(
                          child: TextLink(
                            'Create an Account if you\'re new.',
                            onPressed: () {
                              model.navigateToSignUp();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]
            ),
          )),
    );
  }
}
