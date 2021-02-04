import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/login/viewmodel/login_screen_vm.dart';
import 'package:stacked/stacked.dart';
import 'package:flash/flash.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              model.login(
                email: emailController.text,
                password: passwordController.text,
              );
              showFlash(context: context,
                duration: const Duration(seconds: 4),
                persistent: false,
                builder: (context, controller) {
                return Flash.bar(
                    controller: controller,
                    backgroundGradient: LinearGradient(
                      colors: [quepalStart, quepalEnd],
                    ),
                    position: FlashPosition.top,
                    enableDrag: true,
                    horizontalDismissDirection:
                    HorizontalDismissDirection.startToEnd,
                    margin: const EdgeInsets.all(8),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    forwardAnimationCurve: Curves.easeOutBack,
                    reverseAnimationCurve: Curves.slowMiddle,
                    child: FlashBar(
                      title: Text(
                        'Welcome to Lifegiver Batasan',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      message: Text('Logging in please wait...',style: TextStyle(color: Colors.white),),
                      icon: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                      shouldIconPulse: false,
                      showProgressIndicator: true,
                    ),
                  );
                },
              );
            },
            padding: EdgeInsets.all(0),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    quepalStart,
                    mojitoStart,
                    earthlyStart,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                constraints:
                    BoxConstraints(maxWidth: double.infinity, minHeight: 50),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
