import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/signup/viewmodel/signup_screen_vm.dart';
import 'package:stacked/stacked.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.only(left: 10.0, right:10.0),
        child: Container(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              model.signUp(
                  email: emailController.text,
                  password: passwordController.text);
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
                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                child: Text("Create Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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