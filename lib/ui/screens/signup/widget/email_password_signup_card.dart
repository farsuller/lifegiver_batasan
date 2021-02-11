import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';

class EmailPasswordSigUpCard extends StatelessWidget {
  const EmailPasswordSigUpCard({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Padding(
                  padding: EdgeInsets.only(top: 8.0,bottom: 20.0),
                  child: Center(
                    child: Container(
                        height: 70,
                        child: Image.asset('assets/images/batasan.png',)),
                  ),
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}