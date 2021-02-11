import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';

class EmailPasswordCard extends StatelessWidget {
  const EmailPasswordCard({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 20.0, right: 20.0),
            child: Column(
              children: [
                InputField(placeholder: 'Email',
                  controller: emailController,),
                verticalSpaceSmall,
                InputField(placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}