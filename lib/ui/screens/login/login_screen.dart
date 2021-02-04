import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/ui/widgets/text_link.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';
import 'viewmodel/login_screen_vm.dart';
import 'widget/draw_clip.dart';
import 'widget/login_button.dart';
import 'widget/signup_button.dart';
import 'widget/social_accounts.dart';

import 'package:flash/flash.dart';
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool emailInvalid = false;

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();

    emailController.addListener(() {

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Overlay(
        initialEntries: [
          OverlayEntry(builder: (context)=>Scaffold(
              backgroundColor: bgColor,
              body: Stack(
                  overflow: Overflow.clip,
                  children:[
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
                    Positioned(top: 20, left: 20, right: 20,
                      child: SizedBox(
                        height: 150,
                        child: Image.asset('assets/lifegiver_login.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.02,
                          vertical: SizeConfig.screenHeight * 0.05),
                      child: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overScroll){
                          overScroll.disallowGlow();
                          return;
                        },
                        child: ListView(
                          children: <Widget>[
                            SizedBox(height: 230.0),

                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Card(
                                elevation: 5.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20.0,bottom: 10, left: 20.0, right: 20.0),
                                    child: Column(
                                      children: [
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            verticalSpaceMedium,
                            Center(
                              child: TextLink(
                                'Forgot Password?',
                                onPressed: () {
                                  model.navigateToForgotPassword();
                                },
                              ),
                            ),
                            verticalSpaceMedium,
                            LoginButton(emailController: emailController, passwordController: passwordController),
                            verticalSpaceSmall,
                            SignUpButton(),
                            verticalSpaceMedium,
                            Center(child: SocialAccounts()),
                          ],
                        ),
                      ),
                    ),
                  ]
              )))
        ],
      ),
    );
  }
}
