
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/ui/widgets/text_link.dart';
import 'package:lifegiver_batasan/ui/viewmodels/login_screen_vm.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';


class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight * 0.04, vertical: SizeConfig.screenHeight * 0.10),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/lifegiver_logo.jpg'),
                  ),
                  verticalSpaceSmall,
                  InputField(
                    textInputAction: TextInputAction.continueAction,
                    placeholder: 'Email',
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    textInputAction: TextInputAction.done,
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
            )),
      ),
    );
  }
}
