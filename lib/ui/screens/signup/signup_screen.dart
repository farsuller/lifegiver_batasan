import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/shared/wave_background.dart';
import 'package:lifegiver_batasan/ui/screens/signup/widget/create_account_button.dart';
import 'package:stacked/stacked.dart';
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
                    horizontal: SizeConfig.screenWidth * 0.02,),
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
                          padding: EdgeInsets.only(top: 20.0, left:10.0),
                          child: Text('Create Account',
                            style: TextStyle(color:Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.bold),),
                        ),
                      ),
                      EmailPasswordSigUpCard(emailController: emailController, passwordController: passwordController),
                      verticalSpaceMassive,
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
