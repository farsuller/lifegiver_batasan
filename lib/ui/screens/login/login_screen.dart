import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifegiver_batasan/bloc/bloc.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/errors/1_no_connection.dart';
import 'package:lifegiver_batasan/ui/screens/shared/wave_background.dart';
import 'package:lifegiver_batasan/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';
import 'viewmodel/login_screen_vm.dart';
import 'widget/email_password_card.dart';
import 'widget/login_button.dart';
import 'widget/signup_button.dart';
import 'widget/social_accounts.dart';

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

    emailController.addListener(() {});
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
    SizeConfig().init(context);

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => BlocProvider(
        create: (context) => NetworkBloc()..add(ListenConnection()),
        child: Overlay(initialEntries: [
            OverlayEntry(builder: (context) =>
                Scaffold(
                    backgroundColor: bgColor,
                    body: BlocBuilder<NetworkBloc, NetworkState>(
                      builder: (context, state) {
                        if (state is ConnectionFailure) return NoConnectionScreen();
                        if (state is ConnectionSuccess) return Overlay(
                            initialEntries: [
                              OverlayEntry(
                                builder: (context) => Scaffold(
                                  body: Stack(overflow: Overflow.clip, children: [
                                    WaveBackground(controller: _controller),
                                    Positioned(top: 20, left: 20, right: 20,
                                      child: SizedBox(height: 150,
                                        child: Image.asset(
                                            'assets/images/lifegiver_login.png'),),),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02, vertical: SizeConfig.screenHeight * 0.05),
                                      child: NotificationListener<
                                          OverscrollIndicatorNotification>(onNotification: (overScroll) {
                                          overScroll.disallowGlow();
                                          return;
                                        },
                                        child: ListView(
                                          children: <Widget>[
                                            SizedBox(height: 230.0),
                                            EmailPasswordCard(emailController: emailController, passwordController: passwordController),
                                            verticalSpaceMedium,
                                            Center(child: TextLink('Forgot Password?',
                                                onPressed: () {
                                                  model.navigateToForgotPassword();
                                                },
                                              ),
                                            ),
                                            verticalSpaceMedium,
                                            LoginButton(emailController: emailController,
                                                passwordController: passwordController),
                                            verticalSpaceSmall,
                                            SignUpButton(),
                                            verticalSpaceMedium,
                                            Center(child: SocialAccounts()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              )
                            ],
                          );
                        else return Container();
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
