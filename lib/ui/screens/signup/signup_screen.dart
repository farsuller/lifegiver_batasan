
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/shared/wave_background.dart';
import 'package:lifegiver_batasan/ui/screens/signup/widget/create_account_button.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';
import '../shared/draw_clip.dart';
import '../shared/ui_helpers.dart';
import 'viewmodel/signup_screen_vm.dart';
import 'widget/back_login_button.dart';
import 'widget/email_password_signup_card.dart';


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
      builder: (context, model, child) => WillPopScope(
        onWillPop: model.onBackPressed,
        child: Scaffold(
          body: Stack(
              overflow: Overflow.clip,
            children:[
              WaveBackground(controller: _controller),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02,
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
                        child:  Padding(
                          padding: EdgeInsets.only(top: 8.0, left:10.0),
                          child: Text('Create Account',
                            style: TextStyle(color:Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.bold),),
                        ),
                      ),
                      EmailPasswordSigUpCard(emailController: emailController, passwordController: passwordController),
                      verticalSpaceLarge,
                      CreateAccountButton(emailController: emailController, passwordController: passwordController),
                      verticalSpaceSmall,
                      BackToLoginButton(),
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
